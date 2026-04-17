class Teru < Formula
  desc "AI-first terminal emulator, multiplexer, and tiling manager"
  homepage "https://github.com/nicholasglazer/teru"
  url "https://github.com/nicholasglazer/teru/archive/refs/tags/v0.6.1.tar.gz"
  sha256 "951b00c04a940390e57f05e9ab195337788948e2e918e09f7e74cf6621cf3087"
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
