class Nfd2nfc < Formula
  desc "Convert filesystem entry names from NFD to NFC for cross-platform compatibility"
  homepage "https://github.com/elgar328/nfd2nfc"
  url "https://github.com/elgar328/nfd2nfc/releases/download/v2.0.5/nfd2nfc-2.0.5-universal-apple-darwin.tar.gz"
  sha256 "84e22cff87a0b9f5711295a9eab2c08e6886fc1c5021ddfc607266c7267501f7"
  license "MIT"

  depends_on :macos

  def install
    bin.install "nfd2nfc"
    bin.install "nfd2nfc-watcher"
  end

  test do
    assert_match "nfd2nfc", shell_output("#{bin}/nfd2nfc --version")
  end
end
