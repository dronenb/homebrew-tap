class Incert < Formula
  desc "Add CA certificates into containers"
  homepage "https://github.com/chainguard-dev/incert"
  url "https://github.com/chainguard-dev/incert.git",
      tag:      "v0.6.0",
      revision: "2cf0e57a6c41daf5f6d40120d2f14e1f6009a66f"
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
