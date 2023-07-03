# dotfiles


## Install

Install this repo with `curl` available:

    bash -c "`curl -fsSL https://raw.githubusercontent.com/carmargut/dotfiles/master/install.sh`"

This will clone (using `git`), or download (using `curl` or `wget`), this repo to `~/.dotfiles`. Alternatively, clone manually into the desired location:

    git clone https://github.com/carmargut/dotfiles.git ~/.dotfiles

    

Once installed, execute
```bash
cd ~ # goes to home folder

# Creates a symbolic link for zsh config
mv .zshrc .zshrc_old
ln -s .dotfiles/.zshrc

# Creates a symbolic link for vim config
mv .vimrc .vimrc_old
ln -s .dotfiles/.vimrc
```

If you decide to delete this project, execute
```bash
cd ~ 
mv .zshrc .zshrc_old # restore .zshrc file
mv .vimrc .vimrc_old # restore .vimrc file

```