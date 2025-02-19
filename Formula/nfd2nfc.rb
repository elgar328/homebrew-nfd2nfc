class Nfd2nfc < Formula
  desc "Convert filesystem entry names from NFD to NFC for cross-platform compatibility"
  homepage "https://github.com/elgar328/nfd2nfc"
  url "https://github.com/elgar328/nfd2nfc/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3c9d4068533c7c06c9778757cb0d7c1328c301c70f268cb150166350b8cae76f"
  license "MIT"
  head "https://github.com/elgar328/nfd2nfc.git", branch: "main"

  depends_on "rust" => :build

  on_macos do
    def install
      system "cargo", "build", "--release"
      bin.install "target/release/nfd2nfc"
      bin.install "target/release/nfd2nfc-watcher"
    end

    service do
      run [opt_bin/"nfd2nfc-watcher"]
      keep_alive crashed: true
      run_type :immediate
      working_dir HOMEBREW_PREFIX
    end

    test do
      assert_match "nfd2nfc", shell_output("#{bin}/nfd2nfc --version")
    end
  end

  on_linux do
    odie "nfd2nfc is only supported on macOS."
  end
end