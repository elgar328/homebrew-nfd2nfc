class Nfd2nfc < Formula
  desc "Convert filesystem entry names from NFD to NFC for cross-platform compatibility"
  homepage "https://github.com/elgar328/nfd2nfc"
  url "https://github.com/elgar328/nfd2nfc/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "18ebb9ce69f1b0cd2c1cd3637da1a685c5589e03c6d1adfea52978746a26f1a4"
  license "MIT"
  head "https://github.com/elgar328/nfd2nfc.git", branch: "main"

  depends_on "rust" => :build

  def install
system "cargo", "install", "--locked", "--root=#{prefix}", "--jobs=#{ENV.make_jobs}", "--manifest-path", "nfd2nfc/Cargo.toml"
system "cargo", "install", "--locked", "--root=#{prefix}", "--jobs=#{ENV.make_jobs}", "--manifest-path", "nfd2nfc-watcher/Cargo.toml"
  end

  # Register nfd2nfc-watcher as a user agent.
  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>com.github.elgar328.nfd2nfc</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/nfd2nfc-watcher</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <true/>
        </dict>
      </plist>
    EOS
  end

  # After installation, automatically load the watcher service.
  def post_install
    system "launchctl", "load", "-w", plist_path
  end

  # When uninstalling, unload the watcher service.

  test do
    assert_match "nfd2nfc", shell_output("#{bin}/nfd2nfc --version")
  end
end
