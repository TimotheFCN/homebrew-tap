class RbwNg < Formula
  desc "Unofficial Bitwarden CLI, a maintained continuation of rbw"
  homepage "https://github.com/TimotheFCN/rbw-ng"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.18.1/rbw-ng-1.18.1-aarch64-apple-darwin.tar.gz"
      sha256 "d00a48c0669270cc16e51b29ec40666e20d0d37caa9844d2ec9c9d7898a52879"
    end
    on_intel do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.18.1/rbw-ng-1.18.1-x86_64-apple-darwin.tar.gz"
      sha256 "8fbe85873c76cc683e44a0672fa04b7a3f5025752851920154e33f6e48b8b018"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.18.1/rbw-ng-1.18.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b9242afb783bc9423c5b8db235059f3ac738cc16a8e94d70cd66286814e36772"
    end
    on_intel do
      url "https://github.com/TimotheFCN/rbw-ng/releases/download/1.18.1/rbw-ng-1.18.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0e2795f81e5a0545a35e01f94ed059999822cfa96ac875a534603ccd7b422326"
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
