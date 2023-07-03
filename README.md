# dotfiles


## Install
To install these dotfiles, you can use the following methods:



### Method 1: Using curl
Copy code
```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/carmargut/dotfiles/master/install.sh`"
```
This command will clone the repository to `~/.dotfiles` using `git`, or download it using `curl` or `wget`.

### Method 2: Manual cloning


Copy code
```bash
git clone https://github.com/carmargut/dotfiles.git ~/.dotfiles
```
You can manually clone the repository into the desired location.



## Configuration

Once the repository is installed, run the following commands to create symbolic links for the zsh and vim configurations:

```bash
cd ~ # goes to home folder

# Creates a symbolic link for zsh config
mv .zshrc .zshrc_old
ln -s .dotfiles/.zshrc

# Creates a symbolic link for vim config
mv .vimrc .vimrc_old
ln -s .dotfiles/.vimrc
```

If you ever decide to remove this project, you can restore your original configuration files using the following commands:

```bash
cd ~ 
mv .zshrc .zshrc_old # restore .zshrc file
mv .vimrc .vimrc_old # restore .vimrc file

```


## Updated files

To automatically update the dotfiles on an hourly basis, follow these steps:

Make the `pull.sh` script executable:


```bash
chmod +x pull.sh 

```
Edit your crontab:
```bash
crontab -e
```

Add the following line at the end of the crontab:
```bash
0 * * * * ~/.dotfiles/pull.sh >> ~/.dotfiles/output.txt 2>&1
```
This will execute the `pull.sh` script every hour (at the 0th minute) and redirect the output to `~/.dotfiles/output.txt` (for testing purposes).

By following these steps, your dotfiles will be updated automatically on an hourly basis, and the output will be logged in the `output.txt` file.



## macOS Customizations

To configure macOS settings to preferred defaults, execute the following script:

```bash
./set-mac-defaults.sh
```
The script includes configurations such as enabling AirDrop over every interface, setting Finder preferences, configuring the Dock and hot corners, and more. Note that some changes may require a logout or restart to take effect.

