cask "shure-update-utility" do
  version "2.8.13"
  sha256 "9a458b57d6fb92eae8256a49aad4a220057c16e76988663b072aa4b04a9fd475"

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
