class Jule < Formula
  desc "Simple and safe programming language"
  homepage "https://jule.dev/"
  version "0.3.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "llvm"

  on_macos do
    on_arm do
      url "https://github.com/julelang/jule/releases/download/jule#{version}/jule#{version}-macos-arm64.tar.xz"
      sha256 "e44e712160e9f3af6be50561d4651ee4cf2fd0b484018f7e5592130369344741"
    end
    on_intel do
      url "https://github.com/julelang/jule/releases/download/jule#{version}/jule#{version}-macos-amd64.tar.xz"
      sha256 "d5adec9d3dfac596cf1202671cdf61c81244d58f7e054bcbc70ea246bb388eb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/julelang/jule/releases/download/jule#{version}/jule#{version}-linux-arm64.tar.xz"
      sha256 "08b70be9cacf0b997eaaaf86c0d915479624bb5d64ccde606c87153ae7343d3f"
    end
    on_intel do
      url "https://github.com/julelang/jule/releases/download/jule#{version}/jule#{version}-linux-amd64.tar.xz"
      sha256 "d1b93519b46faad62e9674d7efcf894f8a4203945e78b283923a585cde967027"
    end
  end

  def install
    libexec.install Dir["*"]

    bin.install_symlink libexec/"bin/julec"
  end

  test do
    system bin/"julec", "version"
  end
end
