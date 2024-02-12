cask "cl-editor" do
  version "5.8.1"
  sha256 "dc642acfcf8ef1e1b033b04e5badb33b0caaf013685f4a2ce875910065e696b2"

  url "https://usa.yamaha.com/files/download/software/6/1618626/cl_edt#{version.no_dots}_mac.zip"
  name "CL Editor"
  desc "Provides a complete interface for offline editing and setup of CL consoles"
  homepage "https://usa.yamaha.com/products/proaudio/software/cl_editor/index.html"

  auto_updates false

  app "cl_edt#{version.no_dots}_mac/Uninstall CL Editor.app"
  pkg "cl_edt#{version.no_dots}_mac/Install CL Editor V#{version}.pkg"

  uninstall_preflight do
    system_command  "#{appdir}/Uninstall CL Editor.app/Contents/Resources/Scripts/delpkg.sh",
                    sudo: true
  end

  uninstall quit: "com.yamaha.pa.cleditor"

  zap trash: [
    "~/Library/Preferences/com.yamaha.CL Editor.plist",
    "~/Library/Saved Application State/com.yamaha.pa.cleditor.savedState",
  ]
end
