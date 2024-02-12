cask "yamaha-network-midi" do
  version "2.0.0"
  sha256 "34735b5c101ae32b08be8abd790ce3b8e288f0f55aa6a24eef0215db232e516b"

  url "https://usa.yamaha.com/files/download/software/3/1570013/nm#{version.no_dots}_mac.dmg"
  name "Yamaha Network MIDI"
  desc "For controlling the M7CL, or LS9 via Ethernet"
  homepage "https://usa.yamaha.com/support/updates/nwd_mac.html"

  auto_updates false
  depends_on macos: ">= :catalina"

  pkg "Yamaha Network-MIDI Driver V#{version}.pkg"

  uninstall pkgutil: [
    "com.yamaha.pkg.YamahaNetworkMIDIplugin",
    "com.yamaha.pkg.YamahaNetworkMIDIprefPane",
  ]
end
