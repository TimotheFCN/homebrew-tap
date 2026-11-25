cask "fastwarden" do
  version "0.0.1"
  sha256 "231236d374c36d2c2f4525f6df551397d62f0738c84477b47e2f6d6bbb53f8d1"

  url "https://github.com/TimotheFCN/rbw-desktop/releases/download/#{version}/rbw-desktop-macos-universal.dmg"
  name "Fastwarden"
  desc "Fast desktop client for Bitwarden and Vaultwarden"
  homepage "https://github.com/TimotheFCN/rbw-desktop"

  depends_on macos: ">= :monterey"

  app "Fastwarden.app"

  uninstall quit: "io.github.timothefcn.RbwDesktop"

  zap trash: [
    "~/Library/Application Support/io.github.timothefcn.RbwDesktop",
    "~/Library/Caches/io.github.timothefcn.RbwDesktop",
    "~/Library/Saved Application State/io.github.timothefcn.RbwDesktop.savedState",
  ]

  caveats <<~EOS
    Fastwarden isn't notarized by Apple yet, so macOS blocks its first launch.
    Open System Settings, Privacy & Security, and choose Open Anyway next to
    Fastwarden. Or clear the download flag:
      xattr -dr com.apple.quarantine /Applications/Fastwarden.app
  EOS
end
