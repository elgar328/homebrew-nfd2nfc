class Nfd2nfc < Formula
  desc "Convert filesystem entry names from NFD to NFC for cross-platform compatibility"
  homepage "https://github.com/elgar328/nfd2nfc"
  url "https://github.com/elgar328/nfd2nfc/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "18ebb9ce69f1b0cd2c1cd3637da1a685c5589e03c6d1adfea52978746a26f1a4"
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
      keep_alive SuccessfulExit: false
      run_type :immediate
      working_dir HOMEBREW_PREFIX
      name "com.github.elgar328.nfd2nfc"
    end

    def post_install
      system "launchctl", "load", "-w", plist_path
    end

    test do
      assert_match "nfd2nfc", shell_output("#{bin}/nfd2nfc --version")
    end
  end

  on_linux do
    odie "nfd2nfc is only supported on macOS."
  end
end