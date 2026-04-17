class Teru < Formula
  desc "AI-first terminal emulator, multiplexer, and tiling manager"
  homepage "https://github.com/nicholasglazer/teru"
  url "https://github.com/nicholasglazer/teru/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "d0d3a80a0628425d0f78c80701534a2b6e03f151beb7cdb048c0c27375bd4af5"
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
