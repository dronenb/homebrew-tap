cask "companion" do
  arch arm: "arm64", intel: "x64"

  version "3.2.2+6688-stable-7417d2a0"
  sha256  arm:   "239e39619a2b093eabef9f35135399eee862aa8fb97a85db2272f38099f22859",
          intel: "e2e6707e9a83c8655dcc8a27bedce809a534f1d96dadc83b0b00c517108f6b78"

  url "https://s3.bitfocus.io/builds/companion/companion-mac-#{arch}-#{version}.dmg"
  name "Companion"
  desc "Enables the Elgato Streamdeck to be a professional shotbox surface"
  homepage "https://bitfocus.io/companion"

  app "Companion.app"

  uninstall_postflight do
    system_command "pkill", args: ["-f", "Companion.app"]
  end

  uninstall quit: "test-companion.bitfocus.no"

  zap trash: [
    "~/Library/Application Support/companion",
    "~/Library/Application Support/companion-launcher",
    "~/Library/Preferences/companion.bitfocus.no.plist",
    "~/Library/Preferences/test-companion.bitfocus.no.plist",
  ]
end
