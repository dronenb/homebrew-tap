cask "dante-controller" do
  version "4.14.2.1"
  sha256 "c7715be1d14b423987d638f6a6abfc373835ddb09039ee65acbf773e23620340"

  url "https://audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/DanteController/#{version.major}/#{version.major_minor}/DanteController-#{version}_macos.dmg",
      verified: "audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/"
  name "Dante Controller"
  desc "Route and configure networked devices"
  homepage "https://www.audinate.com/products/software/dante-controller"

  livecheck do
    url "https://software-updates.audinate.com/DanteController/appcast/DanteController-OSX.xml"
    strategy :sparkle
  end

  auto_updates true

  pkg "DanteController.pkg"

  uninstall quit:    "com.audinate.dante.DanteController",
            pkgutil: [
              "com.audinate.dante.pkg.DanteController",
              "com.audinate.dante.pkg.DanteControllerPackage",
              "com.audinate.dante.pkg.DanteUpdateHelper",
              "com.audinate.dante.pkg.DanteUpdateHelperDB",
              "com.audinate.dante.pkg.DanteUpdater",
            ]

  zap trash: [
    "~/Library/Application Support/Dante Controller",
    "~/Library/HTTPStorages/com.audinate.dante.DanteController",
    "~/Library/Logs/Audinate/DanteController*.log",
    "~/Library/Preferences/com.audinate.dante.controller.plist",
    "~/Library/Saved Application State/com.audinate.dante.DanteController.savedState",
  ]
end
