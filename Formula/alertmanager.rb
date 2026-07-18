class Alertmanager < Formula
  desc "Prometheus Alertmanager"
  homepage "https://prometheus.io/docs/alerting/latest/alertmanager/"
  url "https://github.com/prometheus/alertmanager/archive/refs/tags/v0.33.1.tar.gz"
  sha256 "dfe372ecee0704e59e166a6d72f11a689d6b8756366696a0af9fdf801059129b"
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
