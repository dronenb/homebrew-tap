class Crc < Formula
  desc "Tool to help you run containers"
  homepage "https://crc.dev"
  url "https://github.com/crc-org/crc.git",
      tag:      "v2.48.0",
      revision: "1aa46c57ee379d6573f7c86825ef727cad576050"
  license "Apache-2.0"
  head "https://github.com/crc-org/crc.git", branch: "main"

  depends_on "go" => :build
  on_macos do
    conflicts_with "vfkit", because: "both install `vfkit` executable"
  end
  def install
    if OS.mac?
      system "make", "packagedir"
      bin.install "packaging/darwin/root-crc/usr/local/crc/crc"
      bin.install "packaging/darwin/root-crc/usr/local/crc/crc-admin-helper-darwin"
      bin.install "packaging/darwin/root-crc/usr/local/crc/vfkit"
    end
    if OS.linux?
      system "make", "linux-release-binary"
      bin.install "out/linux-amd64/crc"
    end
  end

  def caveats
    <<~EOS
      To complete the setup, add the following entries to /etc/hosts manually:

        127.0.0.1        api.crc.testing canary-openshift-ingress-canary.apps-crc.testing console-openshift-console.apps-crc.testing default-route-openshift-image-registry.apps-crc.testing downloads-openshift-console.apps-crc.testing host.crc.testing oauth-openshift.apps-crc.testing

      You can do this with the following command:
        echo -ne "\\n# Added by CRC\\n127.0.0.1        api.crc.testing canary-openshift-ingress-canary.apps-crc.testing console-openshift-console.apps-crc.testing default-route-openshift-image-registry.apps-crc.testing downloads-openshift-console.apps-crc.testing host.crc.testing oauth-openshift.apps-crc.testing\\n# End of CRC section\\n" | sudo tee -a /etc/hosts
    EOS
  end

  service do
    run ["#{opt_bin}/crc", "daemon", "--log-level", "debug"]
    keep_alive true
  end

  test do
    system bin/"crc", "version"
  end
end
