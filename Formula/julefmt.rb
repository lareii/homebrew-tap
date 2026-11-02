class Julefmt < Formula
  desc "The official formatter tool for the Jule programming language."
  homepage "https://github.com/julelang/julefmt"

  head "https://github.com/julelang/julefmt.git", branch: "main"

  depends_on "jule" => :build

  def install
    system "julec", "build", "--opt-deadcode", "-o", "julefmt", "./src"
    bin.install "julefmt"
  end

  def test
    system bin/"julefmt", "--help"
  end
end
