cask "companion" do
  on_macos do
    arch arm: "arm64", intel: "x64"

    version "3.5.2+7764-stable-fe36af46"
    sha256  arm:    "802392d1eb8d7a63e8f9b60d74501e18fad077e326919072c3af4a2b76059af3",
            x86_64: "564c0eb2b0e6a59e065c2a4073d37a1f3cf398e3ef147ae5e8c87cde4c86d21b"

    url "https://s3.bitfocus.io/builds/companion/companion-mac-#{arch}-#{version}.dmg"
    name "Companion"
    desc "Enables the Elgato Streamdeck to be a professional shotbox surface"
    homepage "https://bitfocus.io/companion"

    app "Companion.app"

    uninstall_postflight do
      system_command "pkill", args: ["-f", "Companion.app"] if system("pgrep -f 'Companion.app' > /dev/null")
    end

    uninstall quit: "test-companion.bitfocus.no"

    zap trash: [
      "~/Library/Application Support/companion",
      "~/Library/Application Support/companion-launcher",
      "~/Library/Preferences/companion.bitfocus.no.plist",
      "~/Library/Preferences/test-companion.bitfocus.no.plist",
    ]
  end
end
