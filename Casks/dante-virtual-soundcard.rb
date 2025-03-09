cask "dante-virtual-soundcard" do
  version "4.5.1.1"
  sha256 "ace833c481ef63f3b91da7a32d9e459905e72b31d0f49091d30165d6b7c4af3c"

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
