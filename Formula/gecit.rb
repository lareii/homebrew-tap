class Gecit < Formula
  desc "DPI bypass tool using TUN on macOS"
  homepage "https://github.com/boratanrikulu/gecit"
  url "https://github.com/boratanrikulu/gecit/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "09f5dcdddcab4bab87c5e704f837060f41a8f99ba36959576e9ae16f530eae3b"
  license "GPL-3.0-only"

  depends_on :macos
  depends_on "go" => :build

  def install
    if Hardware::CPU.arm?
      system "make", "gecit-darwin-arm64"
      bin.install "bin/gecit-darwin-arm64" => "gecit"
    else
      system "make", "gecit-darwin-amd64"
      bin.install "bin/gecit-darwin-amd64" => "gecit"
    end
  end

  test do
    system bin/"gecit", "--help"
  end
end
