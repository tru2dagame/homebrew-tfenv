class Tfenv < Formula
  desc "Terraform version manager inspired by rbenv"
  homepage "https://github.com/tfutils/tfenv"
  license "MIT"
  head "https://github.com/weijing24/tfenv.git"

  stable do
    url "https://github.com/weijing24/tfenv/archive/v2.2.2.tar.gz"
    sha256 "ac7f74d8a0151e36a539ceae1460b320ec7b98b360dbd7799dc7cdbdf8c06ded"

    # v2.0.0 patch / custom version support
    # https://github.com/weijing24/tfenv/pull/3.patch?full_index=1
    patch do
      url "https://patch-diff.githubusercontent.com/raw/weijing24/tfenv/pull/3.patch"
      sha256 "367151a635f23b858f674a5811af6694bf7dafacdda03217ddda61116442be0a"
    end

    patch do
      # url "https://patch-diff.githubusercontent.com/raw/tfutils/tfenv/pull/280.patch"
      # sha256 "a613ea535889333f4e68aea6aed1f8ce3627f68041012167dda97ca6c0853e66"
      url "https://patch-diff.githubusercontent.com/raw/tfutils/tfenv/pull/280.diff"
      sha256 "9d1a0f52c8c96683981a3871ec5d1998ddff70152839ba5bac3e1ba5ed6a077d"
    end
  end

  livecheck do
    url :head
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end


  uses_from_macos "unzip"

  conflicts_with "terraform", because: "tfenv symlinks terraform binaries"

  def install
    prefix.install %w[bin lib libexec share]
  end

  test do
    assert_match "0.10.0", shell_output("#{bin}/tfenv list-remote")
  end
end
