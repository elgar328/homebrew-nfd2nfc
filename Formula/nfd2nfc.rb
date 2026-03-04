class Nfd2nfc < Formula
  desc "Convert filesystem entry names from NFD to NFC for cross-platform compatibility"
  homepage "https://github.com/elgar328/nfd2nfc"
  url "https://github.com/elgar328/nfd2nfc/releases/download/v2.0.6/nfd2nfc-2.0.6-universal-apple-darwin.tar.gz"
  sha256 "10c06f13f53bbe3965339e961f7ad022f8d05d9b7d1e8bd69ba8e056fd1e1216"
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
