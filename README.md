# dotfiles [![Generic badge](https://img.shields.io/badge/Version-v1.0.0-<COLOR>.svg)](https://shields.io/)

My personal dotfiles managed using [chezmoi](https://github.com/twpayne/chezmoi)

## 🚀 Quick install:

```sh
# Install ssh keys
curl "https://github.com/pnwmatt.keys" | head > ~/.ssh/pnwmatt.pub

if [[ "ssh-ed25519 AxAAAC3NzaC1lZDI1NTE5AAAAINjuR4pEtP3LKV6ERcZWeyRMFAT+ehlrt0cmlWq1cPbI" == "`cat ~/ssh/pnwmatt.pub`" ]]
then echo "Keys are still aligned.";
else echo "! GH Account and dotenv KEYS ARE DIFFERENT !"; echo "Press ctlr-c to abort."; read;
fi

brew install chezmoi
chezmoi init --apply --ssh pnwmatt
```

## 📄 License

[Unlicence](https://github.com/pnwmatt/dotfiles/blob/main/LICENSE)

## Thanks

Based on [auricom/dotfiles](https://github.com/auricom/dotfiles).  Thank you for sharing your work!
