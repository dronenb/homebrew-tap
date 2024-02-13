cask "video-downloadhelper-companion" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.17"
  sha256  arm:   "e67e33c46fd6e8a6c08647ee16c4f77746a234bf06a3cff9d2fa771f666a6d57",
          intel: "e043cb2e255836ad749ab626ef34d186cb9df66741728af9dde67a8c7308dffb"

  url "https://github.com/aclap-dev/vdhcoapp/releases/download/v#{version}/vdhcoapp-mac-#{arch}-installer.pkg"
  name "Video DownloadHelper Companion"
  desc "Companion application for Video DownloadHelper browser add-on"
  homepage "https://github.com/aclap-dev/vdhcoapp"

  livecheck do
    url :homepage
  end

  pkg "vdhcoapp-mac-#{arch}-installer.pkg"

  uninstall_preflight do
    system_command "/Applications/net.downloadhelper.coapp.app/Contents/MacOS/vdhcoapp",
                   args: ["uninstall"]
  end

  uninstall quit:    "net.downloadhelper.coapp",
            pkgutil: "net.downloadhelper.coapp"

  zap trash: [
    "/var/db/receipts/net.downloadhelper.coapp.bom",
    "/var/db/receipts/net.downloadhelper.coapp.plist",
  ]
end
