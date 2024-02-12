cask "ql-editor" do
  version "5.8.1"
  sha256 "930ba91c6c28c7542d7a9168c42232f1487e8f6ad587ee39bbc1129655ae4822"

  url "https://usa.yamaha.com/files/download/software/3/1618643/ql_edt#{version.no_dots}_mac.zip"
  name "QL Editor"
  desc "Provides a complete interface for offline editing and setup of QL consoles"
  homepage "https://usa.yamaha.com/products/proaudio/software/ql_editor/index.html"

  auto_updates false

  pkg "ql_edt#{version.no_dots}_mac/Install QL Editor V#{version}.pkg"

  uninstall quit:    "com.yamaha.pa.qleditor",
            pkgutil: "com.yamaha.pkg.qleditor"

  zap trash: [
    "~/Library/Preferences/com.yamaha.QL Editor.plist",
    "~/Library/Saved Application State/com.yamaha.pa.qleditor.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
