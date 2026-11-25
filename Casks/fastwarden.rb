cask "fastwarden" do
  version "0.0.1"
  sha256 "8501f478b97f0addad55dafe91bba3ccee15bf1a5aa04df3ff151a6b3ca8020d"

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
