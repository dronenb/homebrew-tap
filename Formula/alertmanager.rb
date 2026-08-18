class Alertmanager < Formula
  desc "Prometheus Alertmanager"
  homepage "https://prometheus.io/docs/alerting/latest/alertmanager/"
  url "https://github.com/prometheus/alertmanager/archive/refs/tags/v0.33.1.tar.gz"
  sha256 "dfe372ecee0704e59e166a6d72f11a689d6b8756366696a0af9fdf801059129b"
  license "Apache-2.0"

  depends_on "elm" => :build
  depends_on "go" => :build
  depends_on "node" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/prometheus/common/version.Version=#{version}
      -X github.com/prometheus/common/version.Revision=2c8da51e03f3dbbed24f9711ca2d76aab4eef9c5
      -X github.com/prometheus/common/version.Branch=HEAD
      -X github.com/prometheus/common/version.BuildUser=homebrew
      -X github.com/prometheus/common/version.BuildDate=19700101-00:00:00
    ]

    cd "ui/app" do
      inreplace "elm.json", '"elm-version": "0.19.1"', '"elm-version": "0.19.2"'
      system "npm", "ci", "--ignore-scripts"
      ln_sf formula_opt_bin("elm")/"elm", "node_modules/.bin/elm"
      system "npm", "run", "build"
    end

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
