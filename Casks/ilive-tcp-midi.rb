cask "ilive-tcp-midi" do
  version "1.0"
  sha256 :no_check

  url "https://www.allen-heath.com/content/uploads/2023/07/AHTCPMIDIDriverInstaller.zip"
  name "iLive TCP MIDI Driver"
  desc "Bridges iLive TCP MIDI to CoreAudio MIDI"
  homepage "https://www.allen-heath.com/hardware/legacy-products/ilive/resources/"

  auto_updates false

  pkg "A&H TCP MIDI Driver Installer.pkg"

  uninstall quit:    "com.allenandheath.TCPMIDIDriver",
            pkgutil: "com.allenandheath.pkg.TCPMIDIDriver"

  caveats do
    requires_rosetta
  end
end
