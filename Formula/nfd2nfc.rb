class Nfd2nfc < Formula
  desc "Convert filesystem entry names from NFD to NFC for cross-platform compatibility"
  homepage "https://github.com/elgar328/nfd2nfc"
  url "https://github.com/elgar328/nfd2nfc/releases/download/v2.0.1/nfd2nfc-2.0.1-universal-apple-darwin.tar.gz"
  sha256 "b975f9a9056873abcf69054085efa245802f323457460f0e4e0d68809d54772f"
  license "MIT"

  depends_on :macos

  def install
    bin.install "nfd2nfc"
    bin.install "nfd2nfc-watcher"
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
