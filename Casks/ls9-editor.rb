cask "ls9-editor" do
  version "2.2.0"
  sha256 "c03ae4cb9f714b31b6265a5ddec3bfea976d98d51dd5b82a76d47c73b4b7a2ad"

  url "https://usa.yamaha.com/files/download/software/4/1398644/ls9_edt#{version.no_dots}_mac.zip"
  name "LS9 Editor"
  desc "Provides a complete interface for offline editing and setup of LS9 consoles"
  homepage "https://usa.yamaha.com/products/proaudio/software/ls9_editor/index.html"

  auto_updates false
  depends_on  cask:  "dronenb/tap/yamaha-network-midi",
              macos: ">= :catalina"

  pkg "ls9_edt#{version.no_dots}_osx/Install LS9 Editor V#{version}.pkg"

  uninstall quit:    "com.yamaha.ls9editor",
            pkgutil: "com.yamaha.pkg.ls9editor"

  zap trash: [
    "~/Library/Preferences/com.yamaha.ls9.plist",
    "~/Library/Saved Application State/com.yamaha.ls9editor.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
