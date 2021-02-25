#! /bin/bash
change_shell(){
  local ZSH_FILE="/bin/zsh"
  if [ -f "$ZSH_FILE" ]; then
      echo "$ZSH_FILE exist and changing shell"
      chsh -s $ZSH_FILE $USER

      echo "Logging this guy out"
      pkill -KILL -u $USER
  else
      echo "$ZSH_FILE does not exist"
  fi
}

install_packages() {
  local packages=''
  #browser
  packages+=' google-chrome firefox-developer-edition'

  #zsh stuff
  packages+=' zsh-syntax-highlighting'

  # Dev Tools
  packages+=' docker pyenv nvm git'

  # Terminal Stuff
  packages+=' neovim alacritty zsh neofetch'

  # Monitor Tools
  packages+=' autorandr arandr redshift'

  # Window Manager
  packages+=' bspwm sxhkd xdo xdotool'

  # Ricing Tools
  packages+=' xorg-xrdb xorg-xinput xorg-xbacklight xorg-xwininfo tabbed dunstify polybar'

  # Music
  packages+=' pulseaudio pulsemixer'

  # Aur Helper
  packages+=' paru'

  # Font
  packages+= ' ttf-hack'

  sudo pacman -Sy --noconfirm $packages
}

update_mirrors(){
 sudo pacman-mirrors -g
}

install_spaceship(){
  git clone https://aur.archlinux.org/spaceship-prompt-git.git
  cd spaceship-prompt-git
  makepkg -si
}

move_files(){
  cp -r .config/bspwm ~/.config
  cp -r .config/polybar ~/.config
  cp -r .config/sxhkd ~/.config
  cp -r .config/scripts ~/.config

  cp .Xresources ~
  cp .zshenv ~
  cp .zshrc ~
}

setup_fonts(){
  sudo cp -r fonts/SourceCodePro /usr/share/fonts
  sudo cp fonts/icomoon-feather.ttf /usr/share/fonts
  sudo cp fonts/Ubuntu-C.ttf /usr/share/fonts

  fc-cache -fv
}

powershell(){
  pip install powerline-shell
}

main(){
  install_packages
  setup_spacevim
  move_files
  setup_fonts
  change_shell
}

main
