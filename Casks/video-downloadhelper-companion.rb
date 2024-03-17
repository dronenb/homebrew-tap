cask "video-downloadhelper-companion" do
  arch arm: "arm64", intel: "x86_64"

  version "2.0.19"

  on_mojave :or_older do
    sha256  intel: "1d826c8456424445309dac74054f0d954dab2eb089c75ef217de0b08c32dd5c5"

    url "https://github.com/aclap-dev/vdhcoapp/releases/download/v#{version}/vdhcoapp-mac13-#{arch}-installer.pkg"

    pkg "vdhcoapp-mac13-#{arch}-installer.pkg"
  end
  on_catalina :or_newer do
    sha256  arm:   "be91d5896db29724389c79bc8ce2b1b257bf7516068755aa2a4027c87c82eb9b",
            intel: "3e4c513c368aa426d9713c857778996773014bcf1874c909c80cfb6ec96de50e"

    url "https://github.com/aclap-dev/vdhcoapp/releases/download/v#{version}/vdhcoapp-mac-#{arch}-installer.pkg"

    pkg "vdhcoapp-mac-#{arch}-installer.pkg"
  end

  name "Video DownloadHelper Companion"
  desc "Companion application for Video DownloadHelper browser add-on"
  homepage "https://github.com/aclap-dev/vdhcoapp"

  livecheck do
    url :homepage
  end

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
