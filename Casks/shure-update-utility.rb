cask "shure-update-utility" do
  version "2.8.8"
  sha256 "54a637975f07a5c6b96d7461a4978c50d2d180f99260abd70f03487c02987876"

  url "https://content-files.shure.com/Software/shure-update-utility/#{version.dots_to_hyphens}/Shure-Update-Utility-macOS-#{version}.pkg"
  name "Shure Update Utility"
  desc "Helps you update compatible Shure products"
  homepage "https://www.shure.com/en-US/products/software/shure_update_utility"

  auto_updates false

  pkg "Shure-Update-Utility-macOS-#{version}.pkg"

  uninstall quit:    "com.shure.suu",
            pkgutil: "com.shure.suu"

  zap trash: [
    "~/Library/Application Support/Shure/Shure Update Utility",
    "~/Library/Saved Application State/com.shure.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
