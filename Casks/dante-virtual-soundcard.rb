cask "dante-virtual-soundcard" do
  version "4.5.2.3"
  sha256 "8d23b26a1b8b6601f4c5dc370bfcfea7558ec18c297992306830d0205d571a1c"

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
  depends_on :macos

  pkg "DanteVirtualSoundcard.pkg"

  uninstall quit:   "com.audinate.DanteVirtualSoundcard",
            script: {
              executable: "/Library/Application Support/Audinate/DanteVirtualSoundcard/Uninstall DVS.app/Contents/Resources/uninstall.sh",
              sudo:       true,
            }
end
