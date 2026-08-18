class Crc < Formula
  desc "Tool to help you run containers"
  homepage "https://crc.dev"
  url "https://github.com/crc-org/crc.git",
      tag:      "v2.63.0",
      revision: "3a67a3687c5e9013e09a316991f92ef419841481"
  license "Apache-2.0"
  head "https://github.com/crc-org/crc.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/crc-org/crc/v2/pkg/crc/version.crcVersion=#{version}
      -X github.com/crc-org/crc/v2/pkg/crc/version.ocpVersion=4.22.7
      -X github.com/crc-org/crc/v2/pkg/crc/version.okdVersion=4.22.0-okd-scos.6
      -X github.com/crc-org/crc/v2/pkg/crc/version.microshiftVersion=4.22.0
      -X github.com/crc-org/crc/v2/pkg/crc/version.commitSha=3a67a3
    ]

    system "go", "build", *std_go_args(ldflags:), "-tags=containers_image_openpgp", "./cmd/crc"
  end

  def caveats
    <<~EOS
      To prepare your host for CRC, run:
        crc setup

      Then start a cluster with:
        crc start
    EOS
  end

  service do
    run ["#{opt_bin}/crc", "daemon", "--log-level", "debug"]
    keep_alive true
  end

  test do
    assert_predicate bin/"crc", :executable?

    runtime_checks = lambda do
      output = shell_output("#{bin}/crc version")
      assert_match "CRC version: #{version}+3a67a3", output
      assert_match "OpenShift version: 4.22.7", output
      assert_match "MicroShift version: 4.22.0", output

      system bin/"crc", "config", "set", "disk-size", "32"
      assert_match "disk-size : 32", shell_output("#{bin}/crc config get disk-size")
      assert_match "requires disk size in GiB >= 31", shell_output("#{bin}/crc config set disk-size 30 2>&1", 1)
      assert_match "crc does not seem to be setup correctly", shell_output("#{bin}/crc status 2>&1", 1)
    end

    ENV["HOME"] = testpath
    if OS.mac?
      keychain = testpath/"Library/Keychains/crc-test.keychain-db"
      mkdir_p keychain.dirname
      mkdir_p testpath/"Library/Preferences"

      begin
        system "security", "create-keychain", "-p", "test-password", keychain
        system "security", "list-keychains", "-s", keychain
        system "security", "default-keychain", "-s", keychain
        system "security", "unlock-keychain", "-p", "test-password", keychain

        runtime_checks.call
      ensure
        system "security", "delete-keychain", keychain if keychain.exist?
      end
    else
      runtime_checks.call
    end
  end
end
