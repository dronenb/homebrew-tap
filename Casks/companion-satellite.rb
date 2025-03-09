cask "companion-satellite" do
  on_macos do
    arch arm: "arm64", intel: "x64"

    version "459-b31b4b0"
    sha256  arm:    "baf413c0812eb8d5b61bd2e3b9ebca20690876b7162739c87cdc6372d4829fe4",
            x86_64: "72b27a96597a8750aa4bc6867ee353dd68b1720cc1176441bfcca973b69e2c70"

    url "https://s3.bitfocus.io/builds/companion-satellite/companion-satellite-#{arch}-#{version}.dmg"
    name "Companion Satellite"
    desc "Lets you connect another computer with a Stream Deck attached"
    homepage "https://bitfocus.io/companion-satellite"

    app "Companion Satellite.app"

    uninstall quit: "remote.companion.bitfocus.no"

    zap trash: [
      "~/Library/Application Support/companion-satellite",
      "~/Library/Preferences/remote.companion.bitfocus.no.plist",
    ]
  end
end
