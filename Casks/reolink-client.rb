cask "reolink-client" do
  version "8.13.1"
  # For calculating SHA256:
  # curl -sL https://home-cdn.reolink.us/files/client/electron-release/Reolink-8.13.1-mac.zip |  \
  #   shasum -a 256 - | awk '{print $1}' | tr -d '\n' | pbcopy
  sha256 "b6b17005f4922605fdaa61e81fd2060a86ae04be9244295ea51654d36114376b"

  url "https://home-cdn.reolink.us/files/client/electron-release/Reolink-#{version}-mac.zip",
      verified: "home-cdn.reolink.us/"
  name "Reolink Client"
  desc "Security camera system surveillance software"
  homepage "https://reolink.com/software-and-manual/"

  livecheck do
    url "https://home-cdn.reolink.us/files/client/electron-release/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true

  app "Reolink.app"

  uninstall quit: "com.reolink.app"

  zap trash: [
    "~/Library/Application Support/com.reolink.app.client",
    "~/Library/Application Support/reolink",
    "~/Library/Logs/reolink",
    "~/Library/Preferences/ByHost/com.reolink.app.ShipIt.*.plist",
    "~/Library/Preferences/com.reolink.client.plist",
    "~/Library/Saved Application State/com.reolink.app.savedState",
  ]
end
