class Opm < Formula
  desc "CLI to interact with operator-registry and build indexes of operator content"
  homepage "https://github.com/operator-framework/operator-registry"
  url "https://github.com/operator-framework/operator-registry/archive/refs/tags/v1.73.0.tar.gz"
  sha256 "b94a1ccd730a992218bf78cc9bca2a9f9d4c07861158ee4374d6c73000adca30"
  license "Apache-2.0"
  head "https://github.com/operator-framework/operator-registry.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/operator-framework/operator-registry/cmd/opm/version.gitCommit=19af4a3
      -X github.com/operator-framework/operator-registry/cmd/opm/version.opmVersion=#{version}
      -X github.com/operator-framework/operator-registry/cmd/opm/version.buildDate=19700101-00:00:00
    ]

    system "go", "build", *std_go_args(output: bin/"opm", ldflags:),
           "-tags=json1,containers_image_openpgp", "./cmd/opm"
  end

  test do
    assert_match "OpmVersion:\"#{version}\"", shell_output("#{bin}/opm version")

    (testpath/"catalog").mkpath
    (testpath/"catalog/catalog.yaml").write <<~EOS
      ---
      schema: olm.package
      name: test-operator
      defaultChannel: stable
      ---
      schema: olm.channel
      package: test-operator
      name: stable
      entries:
        - name: test-operator.v0.1.0
      ---
      schema: olm.bundle
      name: test-operator.v0.1.0
      package: test-operator
      image: example.com/test-operator:v0.1.0
      properties:
        - type: olm.package
          value:
            packageName: test-operator
            version: 0.1.0
    EOS

    output = shell_output("#{bin}/opm init test-operator --default-channel=stable --output yaml")
    assert_match "schema: olm.package", output
    assert_match "name: test-operator", output
    system bin/"opm", "validate", testpath/"catalog"
  end
end
