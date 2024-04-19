cask "companion-satellite" do
  arch arm: "arm64", intel: "x64"

  version "319-20dfd1e"
  sha256  arm:   "17e861fece822d15211f08a58bd885e013fad5c59acab917b708f478b02b9773",
          intel: "26fab62e6cd9aa3758dbd2574c109f01e7bf5c4c2288346577145780286a04be"

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
