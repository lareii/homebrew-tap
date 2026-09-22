class Jule < Formula
  desc "Safe systems programming language with C and C++ interoperability"
  homepage "https://jule.dev"
  version "0.2.2"
  license "BSD-3-Clause"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/julelang/jule/releases/download/jule0.2.2/jule0.2.2-darwin-arm64.tar.xz"
      sha256 "842a8427c24bebc19df02c4aea7fede7a1e436f44eca279518cd83365549c773"
    end
    on_intel do
      url "https://github.com/julelang/jule/releases/download/jule0.2.2/jule0.2.2-darwin-amd64.tar.xz"
      sha256 "37643bbe11668989f5ab0eba54db0388cbdbcdcbb30fd6cabf13605656a0038b"
    end
  end

  def install
    libexec.install "api", "bin", "std"
    bin.write_exec_script libexec/"bin/julec"
  end

  test do
    system bin/"julec", "help"
  end
end
