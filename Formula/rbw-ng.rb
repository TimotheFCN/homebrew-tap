class RbwNg < Formula
  desc "Unofficial Bitwarden CLI, a maintained continuation of rbw"
  homepage "https://github.com/TimotheFCN/rbw-ng"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.19.0/rbw-ng-1.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "a0d2b228e75e3cb5cf8caf1563adecd70d035feecbd2e1f3f2c571a07d440bb5"
    end
    on_intel do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.19.0/rbw-ng-1.19.0-x86_64-apple-darwin.tar.gz"
      sha256 "cfd7c6eb835079d38c6c4befbb5f98620697d759e885e4f37c6ea84a167d004a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.19.0/rbw-ng-1.19.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fa4156e19a7b37f87a7d3db466595ac876bf46b28c76466bcaba7baa697f9d5e"
    end
    on_intel do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.19.0/rbw-ng-1.19.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c3685094d1f73cb6e0d14e78b41ee7ac294df32d3210e69693285bbb73a673e0"
    end
  end

  conflicts_with "rbw", because: "both install the `rbw` and `rbw-agent` binaries"

  def install
    bin.install "rbw", "rbw-agent"
    bash_completion.install "completion/bash" => "rbw"
    zsh_completion.install "completion/zsh" => "_rbw"
    fish_completion.install "completion/fish" => "rbw.fish"
  end

  def caveats
    on_macos do
      <<~EOS
        rbw asks for your master password through pinentry. To use the macOS
        dialog, install pinentry-mac and select it:
          brew install pinentry-mac
          rbw config set pinentry pinentry-mac
      EOS
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rbw --version")
  end
end
