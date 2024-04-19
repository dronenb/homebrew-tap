class Nmstatectl < Formula
  desc "Command-line tool that manages host networking settings in a declarative manner"
  homepage "https://github.com/nmstate/nmstate"
  url "https://github.com/nmstate/nmstate/releases"
  version "2.2.27"
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-x64.zip"
      sha256 "1bfc4f767ef01ab5069bd750c28b7b0a8b19dd9255ccd0ea94628e952e449fba"
    end
    if Hardware::CPU.arm?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-aarch64.zip"
      sha256 "e13ff659a4e0b52ce5eb30741e575a91d830075a5e5a93301115531f1a60413b"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-linux-x64.zip"
      sha256 "16c5045559541e10c3d4c8793954c13f80cb66619e68be46696e286e4b9ef2f4"
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
