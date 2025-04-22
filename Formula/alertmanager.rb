class Alertmanager < Formula
  desc "Prometheus Alertmanager"
  homepage "https://prometheus.io/docs/alerting/latest/alertmanager/"
  url "https://github.com/prometheus/alertmanager/archive/refs/tags/v0.28.1.tar.gz"
  sha256 "af1a0090fa351fdc21e894278f3690cfd82575ad9354c32a76489b3d50ee6fa2"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    # Build and install Alertmanager binary
    system "go", "build", *std_go_args(output: bin/"alertmanager"), "./cmd/alertmanager"

    # Build and install amtool binary
    system "go", "build", *std_go_args(output: bin/"amtool"), "./cmd/amtool"
  end

  test do
    # Test Alertmanager binary
    assert_match "alertmanager, version", shell_output("#{bin}/alertmanager --version")

    # Test amtool binary
    assert_match "amtool, version", shell_output("#{bin}/amtool --version")
  end
end
