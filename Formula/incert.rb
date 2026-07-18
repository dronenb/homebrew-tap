class Incert < Formula
  desc "Add CA certificates into containers"
  homepage "https://github.com/chainguard-dev/incert"
  url "https://github.com/chainguard-dev/incert.git",
      tag:      "v0.6.0",
      revision: "2cf0e57a6c41daf5f6d40120d2f14e1f6009a66f"
  license "Apache-2.0"
  head "https://github.com/chainguard-dev/incert.git", branch: "main"

  depends_on "go" => :build
  depends_on "crane" => :test

  def install
    ldflags = %w[
      -s -w
    ]

    system "go", "build", *std_go_args(ldflags:), "."
  end

  test do
    require "json"
    require "openssl"
    require "open3"

    assert_match(/Usage of .*incert/, shell_output("#{bin}/incert 2>&1", 1))

    cert = lambda do |common_name|
      key = OpenSSL::PKey::RSA.new(2048)
      subject = OpenSSL::X509::Name.parse("/CN=#{common_name}")
      certificate = OpenSSL::X509::Certificate.new
      certificate.version = 2
      certificate.serial = rand(1..10_000)
      certificate.subject = subject
      certificate.issuer = subject
      certificate.public_key = key.public_key
      certificate.not_before = Time.now
      certificate.not_after = Time.now + 3600

      extension_factory = OpenSSL::X509::ExtensionFactory.new
      extension_factory.subject_certificate = certificate
      extension_factory.issuer_certificate = certificate
      certificate.add_extension extension_factory.create_extension("basicConstraints", "CA:TRUE", true)
      certificate.add_extension extension_factory.create_extension("keyUsage", "keyCertSign,cRLSign", true)
      certificate.sign key, OpenSSL::Digest.new("SHA256")
      certificate
    end

    existing_cert = cert.call("incert-test-existing")
    appended_cert = cert.call("incert-test-appended")
    (testpath/"cert.pem").write appended_cert.to_pem

    (testpath/"root/etc/ssl/certs").mkpath
    (testpath/"root/etc/ssl/certs/ca-certificates.crt").write existing_cert.to_pem
    system "tar", "-cf", testpath/"layer.tar", "-C", testpath/"root", "etc"

    port = free_port
    pid = fork { exec formula_opt_bin("crane")/"crane", "registry", "serve", "--address=127.0.0.1:#{port}" }
    sleep 1
    system formula_opt_bin("crane")/"crane", "append", "--insecure", "--new_layer", testpath/"layer.tar",
           "--new_tag", "127.0.0.1:#{port}/source:latest"

    output = shell_output("#{bin}/incert -image-url=127.0.0.1:#{port}/source:latest " \
                          "-dest-image-url=127.0.0.1:#{port}/dest:latest " \
                          "-ca-certs-file=#{testpath}/cert.pem 2>&1")
    assert_match "127.0.0.1:#{port}/dest:latest@sha256:", output

    manifest = shell_output("#{formula_opt_bin("crane")}/crane manifest --insecure " \
                            "127.0.0.1:#{port}/dest:latest")
    layers = JSON.parse(manifest).fetch("layers")
    assert_equal 2, layers.length

    layer = layers.last.fetch("digest")
    layer_blob, status = Open3.capture2(formula_opt_bin("crane")/"crane", "blob", "--insecure",
                                        "127.0.0.1:#{port}/dest@#{layer}")
    assert_predicate status, :success?
    (testpath/"layer-out.tar").binwrite layer_blob

    (testpath/"layer-out").mkpath
    system "tar", "-xf", testpath/"layer-out.tar", "-C", testpath/"layer-out"
    certs = (testpath/"layer-out/etc/ssl/certs/ca-certificates.crt").read
    assert_match existing_cert.to_pem, certs
    assert_match appended_cert.to_pem, certs
  ensure
    Process.kill("TERM", pid) if pid
    Process.wait(pid) if pid
  end
end
