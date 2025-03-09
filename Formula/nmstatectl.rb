class Nmstatectl < Formula
  desc "Command-line tool that manages host networking settings in a declarative manner"
  homepage "https://nmstate.io/"
  url "https://github.com/nmstate/nmstate.git",
    tag:      "v2.2.42",
    revision: "cfec22f532a03aaeeaa5afb459e7f25195c35291"
  license "Apache-2.0"
  head "https://github.com/nmstate/nmstate.git", branch: "base"

  depends_on "rust" => :build
  depends_on "rustup" => :build

  def install
    system "rustup", "default", "stable"
    system "rustup", "update"
    cd "rust/src/cli" do
      system "cargo", "install", "--no-default-features", "--features", "gen_conf", *std_cargo_args if OS.mac?
      system "cargo", "install", *std_cargo_args if OS.linux?
    end
  end

  test do
    # Validate install
    system "#{bin}/nmstatectl", "version"
  end
end
