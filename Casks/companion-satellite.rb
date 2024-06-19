cask "companion-satellite" do
  arch arm: "arm64", intel: "x64"

  version "337-341e49f"
  sha256  arm:   "1a98b1c091a9dd8adc603cf3b48ef18d70647b484f398a59a87e5eae3409b652",
          intel: "18ef9696e955aa826fc96222e44519900352f7691c1daf76141cac3dbd712633"

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
