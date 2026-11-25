# homebrew-tap

Homebrew packages for two Bitwarden and Vaultwarden clients.

[Fastwarden](https://github.com/TimotheFCN/rbw-desktop) is a fast desktop app
for macOS and Linux. The cask installs the macOS app:

```sh
brew install --cask timothefcn/tap/fastwarden
```

[rbw-ng](https://github.com/TimotheFCN/rbw-ng) is the maintained continuation
of `rbw`, the unofficial Bitwarden CLI:

```sh
brew install timothefcn/tap/rbw-ng
```

Fastwarden comes with its own `rbw`, so install one or the other, not both.

Each project's release workflow updates its file here, `Casks/fastwarden.rb`
and `Formula/rbw-ng.rb`. Report problems in the
[Fastwarden](https://github.com/TimotheFCN/rbw-desktop/issues) or
[rbw-ng](https://github.com/TimotheFCN/rbw-ng/issues) issue tracker.
