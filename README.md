# dotfiles

## Install

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/carmargut/dotfiles/master/install.sh)"
```

The script detects your OS and:
- **macOS**: installs dependencies via Homebrew (zsh, starship, nvm)
- **Ubuntu**: installs via apt + official starship installer + nvm
- Symlinks `.zshrc`, `.vimrc`, `.gitconfig` and `starship.toml` to your home directory
- Sets zsh as the default shell

## Auto-update

To keep dotfiles in sync automatically, add a cron job:

```bash
chmod +x ~/.dotfiles/pull.sh
crontab -e
```

Add this line:
```
0 * * * * ~/.dotfiles/pull.sh >> ~/.dotfiles/output.txt 2>&1 && tail -n 100 ~/.dotfiles/output.txt > /tmp/dots.txt && mv /tmp/dots.txt ~/.dotfiles/output.txt
```

## macOS customizations

```bash
./set-mac-defaults.sh
```

Configures Finder, Dock, hot corners, AirDrop, and other system preferences. Some changes require a logout to take effect.
