# dotfiles
 
Config files for NeoVim, fish, i3, etc.

## Using `stow`

To create symbolic links using `stow`, run

```bash
stow <application_name>
```

So, to create symlinks for something like Neovim you would have to run `stow nvim`. 

To pick up all configs, use 

```bash
stow *
```

## Install script

There's a script, `install.sh`, which you can on Linux to install some of the programs I use
regularly:

```bash
chmod +x install.sh
./install.sh
```

