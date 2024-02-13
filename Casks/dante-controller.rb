cask "dante-controller" do
  version "4.11.1.2"
  sha256 "0b0f700137d0e2113854b2d7210e9930fc11a9c48d0fa2724a97b6ca9cbee388"

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
