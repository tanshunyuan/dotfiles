# Dotfiles
Managed by using GNU Stow.

The structure of the folders follows the one in `.config` folder.
This allow us to perform `stow .` on the root folder to symlink all the files.

# Tiling window managers
## Yabai
```bash
brew services start yabai
brew services stop yabai
```
OR
```bash
yabai --start-service
yabai --stop-service
```

## Aerospace

# Keybinding tools
## Skhd
```bash
brews service start skhd
brews service stop skhd
```