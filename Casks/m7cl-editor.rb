cask "m7cl-editor" do
  version "3.6.0"
  sha256 "0eef85919d4d29fc6d1e16405f98950f5d0be1acacd6569c64f7da21d926d6d7"

  url "https://usa.yamaha.com/files/download/software/3/1398643/m7clv3_edt#{version.no_dots}_mac.zip"
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
end
