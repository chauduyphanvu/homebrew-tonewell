# The release workflow of chauduyphanvu/tonewell writes this file to
# chauduyphanvu/homebrew-tonewell as Formula/tonewell.rb, filling in the version and
# the checksum of the release's zip.
class Tonewell < Formula
  desc "Audio processing chain for files and live macOS system audio"
  homepage "https://github.com/chauduyphanvu/tonewell"
  url "https://github.com/chauduyphanvu/tonewell/releases/download/v0.1.1/tonewell-0.1.1-macos-universal.zip"
  sha256 "0cb21e6b92f00a306658e14af1f62482973fb517b6a5959a06694306a8233911"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "tonewell"
  end

  def caveats
    <<~EOS
      Live mode needs macOS 14.2 or later and the "Screen & System Audio
      Recording" permission: grant it to your terminal app for `tonewell`, and to
      `tonewell` itself for `tonewell start`. Run `tonewell doctor` to check the setup.

      Files other than WAV need ffmpeg:
        brew install ffmpeg
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tonewell --version")
    assert_match "music", shell_output("#{bin}/tonewell presets")
  end
end
