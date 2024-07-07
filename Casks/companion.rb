cask "companion" do
  arch arm: "arm64", intel: "x64"

  version "3.3.1+7001-stable-ee7c3daa"
  sha256  arm:   "92529228103923ea81226b528e3f2fc18049cbaa43b4e4f5366e72ceaae46d55",
          intel: "28ef0bc37e073ea9d5e3e06b705a6efbac27a2ebfb65aaee83722ec097139e60"

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
