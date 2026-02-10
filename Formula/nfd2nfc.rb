class Nfd2nfc < Formula
  desc "Convert filesystem entry names from NFD to NFC for cross-platform compatibility"
  homepage "https://github.com/elgar328/nfd2nfc"
  url "https://github.com/elgar328/nfd2nfc/releases/download/v2.0.2/nfd2nfc-2.0.2-universal-apple-darwin.tar.gz"
  sha256 "e05d4a7ee6f988bbc8b8138148b2abb727c7536740500855c464d0fea685c947"
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
