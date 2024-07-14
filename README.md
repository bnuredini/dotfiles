# dotfiles
 
Config files for vim, bash, i3, etc.

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

