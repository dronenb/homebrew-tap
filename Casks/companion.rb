cask "companion" do
  arch arm: "arm64", intel: "x64"

  version "3.3.1+7001-stable-ee7c3daa"
  sha256  arm:   "a250a9a1c51e9759e208ab4640e5c28842f2992818d1654ad8dedbc73651ad76",
          intel: "5d0bc84b2720818276dba54125241f813f1dabdceb4e2feb5dd3141f2cbace2a"

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
