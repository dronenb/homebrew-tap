class Nmstatectl < Formula
  desc "Command-line tool that manages host networking settings in a declarative manner"
  homepage "https://github.com/nmstate/nmstate"
  url "https://github.com/nmstate/nmstate/releases"
  version "2.2.25"
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-x64.zip"
      sha256 "81c67b890af65d69956464ae865ce63eb61479b660491079d9952663a977c3f7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-macos-aarch64.zip"
      sha256 "e68017b9e874838a914a5b0db58c66be5f19002f945d0bc56a5991f1ce3a609a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/nmstate/nmstate/releases/download/v#{version}/nmstatectl-linux-x64.zip"
      sha256 "df96173b80fb27d2bc2621e0bfa3fed20820b587922d98433b5084a9ac1a50ce"
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
