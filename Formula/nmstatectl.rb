class Nmstatectl < Formula
  desc "Command-line tool that manages host networking settings in a declarative manner"
  homepage "https://github.com/nmstate/nmstate"
  url "https://github.com/nmstate/nmstate/releases"
  version "2.2.26"
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-x64.zip"
      sha256 "0218ac8a133e62c3ab46a7dfd6680eb83d64a50cc33321dc8c2e7adc6b33894e"
    end
    if Hardware::CPU.arm?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-aarch64.zip"
      sha256 "2b9ec796d0004aca6f343e81e60eb95d1a12e6f2fc28a17331d5f8fb1ba68fda"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-linux-x64.zip"
      sha256 "492e190e65726f55b2511b602c357efbf534f4d7f7b2981095c295efda04d3e7"
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
