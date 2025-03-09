cask "shure-wireless-workbench" do
  version "7.4.0"
  sha256 "fd986856c7c8ef8b2df6af8ebca67814d7cb83ddb0bd619eaf4e91e754c5ef1c"

  url "https://content-files.shure.com/Software/wireless-workbench/#{version.dots_to_hyphens}/Wireless-Workbench-macOS-#{version}.pkg"
  name "Shure Wireless Workbench"
  desc "RF spectrum management tools to give you command compatible wireless devices"
  homepage "https://www.shure.com/en-US/products/software/wwb"

  auto_updates false

  pkg "Wireless-Workbench-macOS-#{version}.pkg"

  uninstall quit:    "com.shure.WWB",
            pkgutil: "com.shure.WWB"

  zap trash: [
    "~/Library/Application Support/Shure/WWB",
    "~/Library/Saved Application State/com.shure.WWB.savedState",
  ]
end
