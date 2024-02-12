cask "kinesis-smartset" do
  version "3.0.5"
  sha256 "1477291b5c22f7694016c866fafe2a8484e16236dfa58ca0e1b90a5a3faa0845"

  url "https://gaming.kinesis-ergo.com/download/smartset-app-#{version.major_minor.dots_to_hyphens}-macos-v#{version.dots_to_hyphens}/?wpdmdl=13439&refresh=65ca58d1f1b791707759825"
  name "Kinesis SmartSet"
  desc "GUI for programming Kinesis Freestyle Edge RGB keyboards"
  homepage "https://gaming.kinesis-ergo.com/fs-edge-rgb-support/#smartset"

  auto_updates false

  app "SmartSet App #{version.major_minor} by Kinesis Gaming (macOS v#{version}).app"

  zap trash: [
    "~/Library/Application Support/CrashReporter/SmartSetMaster*",
    "~/Library/HTTPStorages/com.company.SmartSetMaster (Mac)",
    "~/Library/Saved Application State/com.company.SmartSetMaster (Mac).savedState",
  ]

  caveats do
    requires_rosetta
  end
end
