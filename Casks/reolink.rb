cask "reolink" do
  version "8.21.12"
  # For calculating SHA256:
  # curl -sL https://home-cdn.reolink.us/files/client/electron-release/reolink8.21.12_0-0.zip |  \
  #   shasum -a 256 - | awk '{print $1}' | tr -d '\n' | pbcopy
  sha256 "e4f16b53e6d8be27714115ce95e33de3ee25dcd9fbde9108f30b26c38e7790cc"

  url "https://home-cdn.reolink.us/files/client/electron-release/reolink#{version}_0-0.zip",
      verified: "home-cdn.reolink.us/"
  name "Reolink Client"
  desc "Security camera system surveillance software"
  homepage "https://reolink.com/software-and-manual/"

  livecheck do
    url "https://home-cdn.reolink.us/files/client/electron-release/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on :macos

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

  caveats do
    requires_rosetta
  end
end
