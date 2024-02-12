cask "hotkey-eve" do
  version "1.5.0"
  sha256 :no_check

  url "https://web.archive.org/web/20170514042322if_/https://s3.amazonaws.com/hotkeyeve/Downloads/EVE-latest.zip",
      verified: "web.archive.org/" # this is dumb to add this but this project is abandonware...
  name "Hotkey EVE"
  desc "Helps you to learn shortcuts, in order to increase your productivity"
  homepage "https://github.com/Togo/hotkeyEVE"

  auto_updates true

  app "EVE.app"

  uninstall quit: "com.togo.hotkeyEVE"

  zap trash: [
    "~/Library/Application Support/Eve",
    "~/Library/Caches/com.togo.hotkeyEVE",
    "~/Library/HTTPStorages/com.togo.hotkeyEVE",
    "~/Library/Logs/EVE",
    "~/Library/Preferences/com.togo.hotkeyEVE.plist",
  ]

  caveats do
    requires_rosetta
  end
end
