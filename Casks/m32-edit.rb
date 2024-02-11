cask "m32-edit" do
  version "4.3"
  sha256 "4166b835dfcff9f24426d245ffbf82ada0573aaa9ffe4eef260d0294a047f582"

  url "https://mediadl.musictribe.com/download/software/midas_M32/M32-Edit_MAC_#{version}.zip",
      verified: "mediadl.musictribe.com/"
  name "M32 Edit"
  desc "Allow for complete editing control of the M32 via the network"
  homepage "https://www.midasconsoles.com/downloads.html"

  auto_updates false

  app "M32-Edit_#{version}/M32-Edit.app"

  zap trash: [
    "~/Library/.M32-Edit",
    "~/Library/Preferences/com.musictribe.M32-Edit.plist",
    "~/Library/Saved Application State/com.musictribe.M32-Edit.savedState",
  ]
end
