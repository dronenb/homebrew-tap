class Alertmanager < Formula
  desc "Prometheus Alertmanager"
  homepage "https://prometheus.io/docs/alerting/latest/alertmanager/"
  url "https://github.com/prometheus/alertmanager/archive/refs/tags/v0.30.1.tar.gz"
  sha256 "b3577c531d4c05e0f45f90b02224c81684be9f4083720a01cc05bfa07107fc93"
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
