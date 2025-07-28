# dotfiles [![Generic badge](https://img.shields.io/badge/Version-v1.0.0-<COLOR>.svg)](https://shields.io/)

My personal dotfiles managed using [chezmoi](https://github.com/twpayne/chezmoi)

## 🚀 Quick install:

```sh
# Install ssh keys
curl "https://github.com/pnwmatt.keys" | head > ~/.ssh/pnwmatt.pub

if [[ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINjuR4pEtP3LKV6ERcZWeyRMFAT+ehlrt0cmlWq1cPbI" == "`cat ~/.ssh/pnwmatt.pub`" ]]
then echo "Keys are still aligned.";
else echo "! GH Account and dotenv KEYS ARE DIFFERENT !"; echo "Press ctlr-c to abort."; read;
fi

brew install chezmoi
chezmoi init --apply --ssh pnwmatt
```

## Notes
* All chezmoi commands accept the -v (verbose) flag to print out exactly what changes they will make to the file system, and the -n (dry run) flag to not make any actual changes. The combination -n -v is very useful if you want to see exactly what changes would be made.
* `chezmoi <edit|add|diff|apply>` standard flow
  * `update` pull latest changes from the remote repository
  * `<managed|unmanaged>` to see everything (not) managed by chezmoi.
* You don't need to `edit` .dotfiles in 

## 📄 License

[Unlicence](https://github.com/pnwmatt/dotfiles/blob/main/LICENSE)

## Thanks

Based on [auricom/dotfiles](https://github.com/auricom/dotfiles).  Thank you for sharing your work!
