cask "m-air-edit" do
  version "1.8"
  sha256 "533313d0a657c71537859641e10372d1217a92f15c50265ccb9f0a503f1073fe"

  url "https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_MAC_#{version}.zip",
      verified: "mediadl.musictribe.com/"
  name "M-Air Edit"
  desc "Allow for complete editing control of the M-Air via the network"
  homepage "https://www.midasconsoles.com/downloads.html"

  auto_updates false

  app "M-AIR-Edit.app"

  uninstall quit: "com.musictribe.M-AIR-Edit"

  zap trash: [
    "~/Library/.M-AIR-Edit",
    "~/Library/Preferences/com.musictribe.M-AIR-Edit.plist",
    "~/Library/Saved Application State/com.musictribe.M-AIR-Edit.savedState",
  ]
end
