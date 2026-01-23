cask "wing-edit" do
  version "3.3.1"
  sha256 "1aedb084f4f1b94d9e8f4b0382dea9ce84499905b98859f47aa05b7024a01685"

  url "https://mediadl.musictribe.com/download/software/behringer/WING/EDIT/Wing-Edit_MAC_#{version}.zip",
      verified: "mediadl.musictribe.com/"
  name "WING-Edit"
  desc "Allow for complete editing control of the WING via the network"
  homepage "https://www.behringer.com/downloads.html"

  auto_updates false

  app "WING-Edit.app"

  uninstall quit: "com.Musictribe.WINGEdit"

  zap trash: [
    "~/Library/.WingEdit",
    "~/Library/Preferences/com.Musictribe.WINGEdit.plist",
    "~/Library/Saved Application State/com.Musictribe.WINGEdit.savedState",
  ]
end
