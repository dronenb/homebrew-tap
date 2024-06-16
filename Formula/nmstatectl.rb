class Nmstatectl < Formula
  desc "Command-line tool that manages host networking settings in a declarative manner"
  homepage "https://github.com/nmstate/nmstate"
  url "https://github.com/nmstate/nmstate/releases"
  version "2.2.33"
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-x64.zip"
      sha256 "7b889f5c152c61aab81d29dd2a6eec9ac03d199ea464dd5b48f3f10a488546d9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-aarch64.zip"
      sha256 "ec9ccd660c25a0c99ee28b587efe1af5a97493bb93343caf817812282b162613"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-linux-x64.zip"
      sha256 "79fb3149b76863783bbf3dc40514200866a1d90410144b03b7a5b6a874c99fd5"
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
