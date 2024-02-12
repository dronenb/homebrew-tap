cask "wing-edit" do
  version "1.2"
  sha256 "ec0c0123bc44c80dfa0446f90c069ddbcf963e3f3d9b8562956b3bf6a6acbad7"

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
