class Tfenv < Formula
  desc "Terraform version manager inspired by rbenv"
  homepage "https://github.com/tfutils/tfenv"
  license "MIT"
  head "https://github.com/weijing24/tfenv.git"

  stable do
    url "https://github.com/weijing24/tfenv/archive/v2.2.0.tar.gz"
    sha256 "628c55bca9adf96a8d31c3f95b01aab170c3002c150ceb22cadd03366854d071"

    # v2.0.0 patch / custom version support
    # https://github.com/weijing24/tfenv/pull/3.patch?full_index=1
    patch do
      url "https://patch-diff.githubusercontent.com/raw/weijing24/tfenv/pull/3.patch"
      sha256 "367151a635f23b858f674a5811af6694bf7dafacdda03217ddda61116442be0a"
    end
  end

  livecheck do
    url :head
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  bottle :unneeded

  uses_from_macos "unzip"

  conflicts_with "terraform", because: "tfenv symlinks terraform binaries"

  def install
    prefix.install %w[bin lib libexec share]
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/tfenv list-remote")
  end
end
