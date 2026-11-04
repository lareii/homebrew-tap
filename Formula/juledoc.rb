class Juledoc < Formula
  desc "Official documentation generator for the Jule programming language"
  homepage "https://github.com/julelang/juledoc"

  head "https://github.com/julelang/juledoc.git", branch: "main"

  depends_on "lareii/tap/jule" => :build

  def install
    system "julec", "build", "--opt-deadcode", "-o", "juledoc", "./src"
    bin.install "juledoc"
  end

  test do
    system bin/"juledoc", "--help"
  end
end
