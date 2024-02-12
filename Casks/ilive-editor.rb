cask "ilive-editor" do
  version "1.95"
  sha256 "e75d043d19f16c0617ba745cba0d625aca2f929f10fda977810559ce88eab92f"

  url "https://www.allen-heath.com/content/uploads/2023/07/iLiveEditor#{version}.pkg_.zip?"
  name "iLive Editor"
  desc "Provides a complete interface for offline editing and setup of iLive consoles"
  homepage "https://www.allen-heath.com/hardware/legacy-products/ilive/resources/"

  auto_updates false

  pkg "iLiveEditor#{version}.pkg"

  uninstall_postflight do
    system_command "pkill", args: ["-f", "iLiveEditor#{version}.app"]
  end

  uninstall quit:    "com.allenheath.ilivesystemmanager.ciLiveSystemManager",
            pkgutil: "com.allenheath.ilivesystemmanager.ciLiveSystemManager",
            delete:  [
              "/var/db/receipts/com.allenheath.ilivesystemmanager.ciLiveSystemManager.plist",
              "/var/db/receipts/com.allenheath.ilivesystemmanager.ciLiveSystemManager.plist",
            ]

  caveats do
    requires_rosetta
  end
end
