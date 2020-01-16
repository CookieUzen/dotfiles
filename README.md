# Dotfiles
Welcome to the home of Uzen's dotfiles.

## Installation
The folder is downloaded in the home directory. In that is undesired, changed the `$dotfiles` variable in the install script.

**To begin the install:**
```bash
cd ~
git clone https://github.com/CookieUzen/dotfiles.git
cd dotfiles
./install.sh
```
## Symlink V.S. Copy
The author likes to keep his dotfiles in a git repository for easy access. Thus all files are symlinked over. If you do not wish to copy the dotfiles instead of symlinking them, run `install.cp.sh`.

## Important Note
This dotfiles site is part of a bigger project. Sometimes some configurations (like the neovim configuration) will not work unless properly setted up. The other project explains the process of further set up, you can check it out [here](https://github.com/Uzens-Manjaro-Setup):


# Disclaimer
All files in this git repository is design for the author's use. **Modify the files to suit your needs**.
