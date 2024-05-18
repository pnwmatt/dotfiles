# dotfiles [![Generic badge](https://img.shields.io/badge/Version-v1.0.0-<COLOR>.svg)](https://shields.io/)

My personal dotfiles managed using [chezmoi](https://github.com/twpayne/chezmoi)

## 🚀 Getting started (Bluefin)

1. Install chezmoi `brew install chezmoi`

2. Deploy ed25519 SSH key on `~/.ssh/id_ed25519`

3. Deploy chezmoi age key on `~/.config/sops/age/chezmoi.txt`

4. Apply dotfiles `chezmoi init --apply --ssh auricom`

## 📄 License

[Unlicence](https://github.com/auricom/dotfiles/blob/main/LICENSE)
