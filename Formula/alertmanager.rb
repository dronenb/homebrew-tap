class Alertmanager < Formula
  desc "Prometheus Alertmanager"
  homepage "https://prometheus.io/docs/alerting/latest/alertmanager/"
  url "https://github.com/prometheus/alertmanager/archive/refs/tags/v0.34.0.tar.gz"
  sha256 "f09117dd6ad62d3f53d2618ba3950ced4a318110b95ce5afe76b7df0ba74000f"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "node" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/prometheus/common/version.Version=#{version}
      -X github.com/prometheus/common/version.Revision=085f0ef7eb41da24cab8cd000f1345b6250f2edb
      -X github.com/prometheus/common/version.Branch=HEAD
      -X github.com/prometheus/common/version.BuildUser=homebrew
      -X github.com/prometheus/common/version.BuildDate=19700101-00:00:00
    ]

    system "make", "ui-elm"

    system "go", "build", *std_go_args(output: bin/"alertmanager", ldflags:), "./cmd/alertmanager"
    system "go", "build", *std_go_args(output: bin/"amtool", ldflags:), "./cmd/amtool"
  end

  test do
    require "net/http"

    assert_match "alertmanager, version #{version}", shell_output("#{bin}/alertmanager --version")
    assert_match "amtool, version #{version}", shell_output("#{bin}/amtool --version")

    (testpath/"alertmanager.yml").write <<~YAML
      route:
        receiver: default
      receivers:
        - name: default
    YAML

    assert_match "SUCCESS", shell_output("#{bin}/amtool check-config #{testpath}/alertmanager.yml")

    port = free_port
    pid = fork do
      exec bin/"alertmanager", "--config.file=#{testpath}/alertmanager.yml",
                               "--storage.path=#{testpath}/data",
                               "--cluster.listen-address=",
                               "--web.listen-address=127.0.0.1:#{port}"
    end
    sleep 3
    assert_equal "OK", Net::HTTP.get(URI("http://127.0.0.1:#{port}/-/ready"))
  ensure
    Process.kill("TERM", pid) if pid
    Process.wait(pid) if pid
  end
end
