class Nmstatectl < Formula
  desc "Command-line tool that manages host networking settings in a declarative manner"
  homepage "https://github.com/nmstate/nmstate"
  url "https://github.com/nmstate/nmstate/releases"
  version "2.2.38"
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-x64.zip"
      sha256 "c0c94c4c7b4d3dbd7059c8d0da7d93812a1fcbc884214920bdd5162f277a3a71"
    end
    if Hardware::CPU.arm?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-aarch64.zip"
      sha256 "b6b06fa5b1cb6e776277ce558b7a9b8efa1c497adf716336d066f95954920d62"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-linux-x64.zip"
      sha256 "c6a3ed7f0a2d284b78cada49e2c3abeb2b366511f4c8ee19b2b7377ec2806675"
    end
  end

  def install
    bin.install "nmstatectl"
  end

  test do
    # Validate install
    system "#{bin}/nmstatectl", "version"
  end
end
