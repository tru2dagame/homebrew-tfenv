class Tfenv < Formula
  desc "Terraform version manager inspired by rbenv"
  homepage "https://github.com/tfutils/tfenv"
  license "MIT"
  head "https://github.com/weijing24/tfenv.git"

  stable do
    url "https://github.com/weijing24/tfenv/archive/v2.0.0.tar.gz"
    sha256 "de3dcf13768cb078e94d68ca85071b8d6e44104394336d952255ca558b854b0b"

    # v2.0.0 patch / custom version support
    # https://github.com/weijing24/tfenv/pull/2.patch?full_index=1
    patch do
      url "https://patch-diff.githubusercontent.com/raw/weijing24/tfenv/pull/2.patch?full_index=1"
      sha256 "c4284310b058e1177f414795f619b822379876b4ba6b26134b0a41da77a42b3f"
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