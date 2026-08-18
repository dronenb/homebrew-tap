class Seclists < Formula
  desc "Collection of multiple types of lists used during security assessments"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists/archive/refs/tags/2026.1.tar.gz"
  sha256 "226c49d04974ec6c39dadbf38ba78e67fec8824d729e66907f6050329da98932"
  license "MIT"

  def install
    pkgshare.install Dir["*"]
  end

  def caveats
    <<~EOS
      Wordlists have been installed to:
        #{opt_pkgshare}
    EOS
  end

  test do
    assert_path_exists pkgshare/"Passwords/Common-Credentials/Pwdb_top-1000000.txt"
  end
end
