cask "crc" do
  version "2.57.0"
  sha256 "3a742c3be4b890563c500fe00ecd04544c56a8315a0990b952df41d2e84021f2"

  url "https://developers.redhat.com/content-gateway/file/pub/openshift-v4/clients/crc/#{version}/crc-macos-installer.pkg",
      verified: "developers.redhat.com/"
  name "Code Ready Containers"
  desc "Is a tool to help you run containers"
  homepage "https://crc.dev/"

  livecheck do
    url "https://github.com/crc-org/crc/releases/latest"
    strategy :github_latest
    regex(/^v?(\d+\.\d+\.\d+)-\d+\.\d+\.\d+$/i)
  end

  auto_updates false

  pkg "crc-macos-installer.pkg"

  uninstall launchctl: "com.redhat.crc.daemon",
            pkgutil:   "com.redhat.crc"
end
