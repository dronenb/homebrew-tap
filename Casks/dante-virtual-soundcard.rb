cask "dante-virtual-soundcard" do
  version "4.4.1.3"
  sha256 "ff2b5384b4905ed479915e8d4f9a1220abc88a379a0e129d2f76c302c8e72a99"

  url "https://audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/DanteVirtualSoundcard/#{version.major}/#{version.major_minor}/macOS/DVS-#{version}_macos.dmg",
      verified: "audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/"
  name "Dante Virtual Soundcard"
  desc "Turns your computer into a Dante-powered workstation"
  homepage "https://www.audinate.com/products/software/dante-virtual-soundcard"

  livecheck do
    url "https://software-updates.audinate.com/DanteVirtualSoundcard/appcast/macOS/DanteVirtualSoundcard-macOS.xml"
    strategy :sparkle
  end

  auto_updates true

  pkg "DanteVirtualSoundcard.pkg"

  uninstall quit:   "com.audinate.DanteVirtualSoundcard",
            script: {
              executable: "/Library/Application Support/Audinate/DanteVirtualSoundcard/Uninstall DVS.app/Contents/Resources/uninstall.sh",
              sudo:       true,
            }
end
