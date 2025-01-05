cask "wing-edit" do
  version "3.1"
  sha256 "d5cd28c8c20432dedc6e56351c5e8bf3e6ad01bfb21a19fede2038749292f2a9"

  url "https://mediadl.musictribe.com/download/software/behringer/WING/Wing-Edit_MAC_#{version}.zip",
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
