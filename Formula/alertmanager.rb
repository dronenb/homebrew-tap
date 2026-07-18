class Alertmanager < Formula
  desc "Prometheus Alertmanager"
  homepage "https://prometheus.io/docs/alerting/latest/alertmanager/"
  url "https://github.com/prometheus/alertmanager/archive/refs/tags/v0.33.1.tar.gz"
  sha256 "dfe372ecee0704e59e166a6d72f11a689d6b8756366696a0af9fdf801059129b"
  license "Apache-2.0"

  depends_on "go" => :build

  resource "web_ui" do
    url "https://github.com/prometheus/alertmanager/releases/download/v0.33.1/alertmanager-web-ui-0.33.1.tar.gz"
    sha256 "1f63344e196e47ba7bfe27276f44c1da77e39fb76493e42b2cf0a50ca8f04321"
  end

  def install
    resource("web_ui").stage do
      cp_r Pathname.pwd, buildpath/"ui/app/dist"
    end

    system "go", "build", *std_go_args(output: bin/"alertmanager"), "./cmd/alertmanager"
    system "go", "build", *std_go_args(output: bin/"amtool"), "./cmd/amtool"
  end

  test do
    assert_match "alertmanager, version", shell_output("#{bin}/alertmanager --version")
    assert_match "amtool, version", shell_output("#{bin}/amtool --version")
  end
end
