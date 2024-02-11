cask "x-air-edit" do
  version "1.8"
  sha256 "db89c7b48c1ee077c1abf05671b7dbca78e244db8f7c882e375ff69e2e7275f7"

  url "https://mediadl.musictribe.com/download/software/behringer/XAIR/X-AIR-Edit_MAC_#{version}.zip",
      verified: "mediadl.musictribe.com/"
  name "X-Air Edit"
  desc "Allow for complete editing control of the X-Air via the network"
  homepage "https://www.behringer.com/downloads.html"

  auto_updates false

  app "X-AIR-Edit.app"

  uninstall quit: "com.musictribe.X-AIR-Edit"

  zap trash: [
    "~/Library/.X-AIR-Edit",
    "~/Library/Preferences/com.musictribe.X-AIR-Edit.plist",
    "~/Library/Saved Application State/com.musictribe.X-AIR-Edit.savedState",
  ]
end
