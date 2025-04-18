class Incert < Formula
  desc "Add CA certificates into containers"
  homepage "https://github.com/chainguard-dev/incert"
  url "https://github.com/chainguard-dev/incert.git",
      tag:      "v0.5.0",
      revision: "7e639077cf3f132531e1231cb4adeb16b4ab6417"
  license "Apache-2.0"
  head "https://github.com/chainguard-dev/incert.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %w[
      -s -w
    ]

    system "go", "build", *std_go_args(ldflags:), "."
  end

  # TODO: figure out how to test...
  # test do
  #   assert_match "Private key written to cosign.key",
  #     pipe_output("#{bin}/cosign generate-key-pair 2>&1", "foo\nfoo\n")
  #   assert_path_exists testpath/"cosign.pub"

  #   assert_match version.to_s, shell_output(bin/"cosign version 2>&1")
  # end
end
