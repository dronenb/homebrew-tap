cask "shure-wireless-workbench" do
  version "7.7.0"
  sha256 "1e982c3f1425b9c0fda7aa045984236c0c6a56b288ffb3d1dc723a6a075353e8"

  url "https://content-files.shure.com/Software/wireless-workbench/#{version.dots_to_hyphens}/Wireless-Workbench-macOS-#{version}.pkg"
  name "Shure Wireless Workbench"
  desc "RF spectrum management tools to give you command compatible wireless devices"
  homepage "https://www.shure.com/en-US/products/software/wwb"

  auto_updates false
  depends_on :macos

  pkg "Wireless-Workbench-macOS-#{version}.pkg"

  uninstall quit:    "com.shure.WWB",
            pkgutil: "com.shure.WWB"

  zap trash: [
    "~/Library/Application Support/Shure/WWB",
    "~/Library/Saved Application State/com.shure.WWB.savedState",
  ]
end
