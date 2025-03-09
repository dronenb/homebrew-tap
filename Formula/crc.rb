class Crc < Formula
  desc "Tool to help you run containers"
  homepage "https://crc.dev"
  url "https://github.com/crc-org/crc.git",
      tag:      "v2.48.0",
      revision: "1aa46c57ee379d6573f7c86825ef727cad576050"
  license "Apache-2.0"
  head "https://github.com/crc-org/crc.git", branch: "main"

  depends_on "go" => :build

  def install
    if OS.mac?
      system "make", "macos-release-binary"
      bin.install "out/macos-universal/crc"
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
    system "#{opt_bin}/crc", "version"
  end
end
