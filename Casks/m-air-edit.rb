cask "m-air-edit" do
  version "1.8.1"
  sha256 "e7d1146f1695146304b8f80719a2dd202cd8501be9b080e7503f557309ece942"

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
