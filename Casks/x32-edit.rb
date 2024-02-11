cask "x32-edit" do
  version "4.3"
  sha256 "ed200bdd08a7fbbf8146f18f4bc95011a814d7a283f04a36040b11e4445da13b"

  url "https://mediadl.musictribe.com/download/software/behringer/X32/X32-Edit_MAC_#{version}.zip",
      verified: "mediadl.musictribe.com/"
  name "X32 Edit"
  desc "Allow for complete editing control of the X32 via the network"
  homepage "https://www.behringer.com/downloads.html"

  auto_updates false

  app "X32-Edit_#{version}/X32-Edit.app"

  zap trash: [
    "~/Library/.X32-Edit",
    "~/Library/Preferences/com.musictribe.X32-Edit.plist",
    "~/Library/Saved Application State/com.musictribe.X32-Edit.savedState",
  ]
end
