class Teru < Formula
  desc "AI-first terminal emulator, multiplexer, and tiling manager"
  homepage "https://github.com/nicholasglazer/teru"
  url "https://github.com/nicholasglazer/teru/archive/refs/tags/v0.6.3.tar.gz"
  sha256 "ab04faf20f1394450ffee5510022a21cfae9418f9c9801616928cc54443c6f93"
  license "MIT"
  head "https://github.com/nicholasglazer/teru.git", branch: "main"

  depends_on "zig" => :build

  on_macos do
    depends_on xcode: :build
  end

  on_linux do
    depends_on "libxcb"
    depends_on "libxkbcommon"
    depends_on "wayland"
  end

  def install
    system "zig", "build", "-Doptimize=ReleaseSafe"
    bin.install "zig-out/bin/teru"
  end

  test do
    assert_match "teru", shell_output("#{bin}/teru --version")
  end
end
