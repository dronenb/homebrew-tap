cask "companion" do
  arch arm: "arm64", intel: "x64"

  version "3.2.1+6676-stable-fa981d25"
  sha256  arm:   "3f74cc1e39c758566ef5da675761d9fac4fb2733084b5849d57ff8cbfd79912e",
          intel: "ec911f1ff8f43a7534e50e7a6bd5e93adbc23eff430a6e7d3307847afa437a42"

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
