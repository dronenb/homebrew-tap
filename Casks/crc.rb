cask "crc" do
  version "2.48.0"
  sha256 "342614bccd1b633783bc042263caba0d05b7a93b05a3539504b539ae7b26ecad"

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
