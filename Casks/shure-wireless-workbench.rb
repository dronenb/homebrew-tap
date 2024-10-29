cask "shure-wireless-workbench" do
  version "7.2.0"
  sha256 "6256ed031d21380dbdfc1049e9e5b3b662fcc7dbdfdd767f52ad4a3051298b42"

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
