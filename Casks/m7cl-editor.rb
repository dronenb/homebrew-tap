cask "m7cl-editor" do
  version "3.6.1"
  sha256 "a2c5b7f50411f9af018ca6bca5e76e0f0a9482f267b38cf2c53b0a4e535ff265"

  url "https://usa.yamaha.com/files/download/software/5/2320605/m7clv3_edt#{version.no_dots}_mac.zip"
  name "M7CL Editor"
  desc "Provides a complete interface for offline editing and setup of M7CL consoles"
  homepage "https://usa.yamaha.com/products/proaudio/software/m7cl_v3_editor/index.html"

  auto_updates false
  depends_on  cask:  "dronenb/tap/yamaha-network-midi",
              macos: ">= :catalina"

  pkg "m7clv3_edt#{version.no_dots}_osx/Install M7CL V3 Editor V#{version}.pkg"

  uninstall quit:    "com.yamaha.m7cleditor",
            pkgutil: "com.yamaha.pkg.m7clV3editor"

  zap trash: [
    "~/Library/Preferences/com.yamaha.m7cl.plist",
    "~/Library/Saved Application State/com.yamaha.m7cleditor.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
