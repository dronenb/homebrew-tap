cask "companion-satellite" do
  arch arm: "arm64", intel: "x64"

  version "270-ed43061"
  sha256  arm:   "cfc4f6f6656c5a5eed0452d90ced8d8e6189d30d2e0f92f5f5aea369824ca4fc",
          intel: "1f0b48148141485c144d883763e1d960079a46a3a1d7b2e8894abf26c5fac82f"

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
