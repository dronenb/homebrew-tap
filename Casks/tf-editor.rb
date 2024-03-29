cask "tf-editor" do
  version "4.5.0"
  sha256 "0adbd129036a2e5983c135b0379fad12b32766656f638a26d29c1881d62bfd96"

  url "https://usa.yamaha.com/files/download/software/3/1388743/tf_edt#{version.no_dots}_mac.zip"
  name "TF Editor"
  desc "Provides a complete interface for offline editing and setup of TF consoles"
  homepage "https://usa.yamaha.com/support/updates/tf_edt_mac.html"

  auto_updates false

  pkg "Install TF Editor V#{version}.pkg"

  uninstall quit:    "com.yamaha.pa.qleditor",
            pkgutil: "com.yamaha.pkg.qleditor"

  zap trash: "~/Library/Saved Application State/jp.co.yamaha.pa.tfeditor.savedState"

  caveats do
    requires_rosetta
  end
end
