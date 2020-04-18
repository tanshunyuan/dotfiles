#! /bin/bash
# sudo pacman -S powerline \
		# docker \
		# redshift \
		# arandr \
		# autorandr \
		# poetry \
		# xorg-xrdb \
		# polybar \
    # xorg-xinput \
    # xorg-xbacklight \
    # nvim \

setup_spacevim(){
  local SPACEVIM_FILE="$HOME/.SpaceVim.d/init.toml"

  if [ -f "$SPACEVIM_FILE" ]; then
      echo "$SPACEVIM_FILE exist"
  else
      echo "$SPACEVIM_FILE does not exist"
      curl -sLf https://spacevim.org/install.sh | bash
      # Lsp
      npm install -g javascript-typescript-langserver
      npm install -g typescript-language-server
      npm install -g vscode-css-languageserver-bin
      npm install -g vscode-html-languageserver-bin
      pip install --user python-language-server

      # Python dep
      pip install --user flake8
      pip install --user yapf
  fi
}

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
  local packages = ''

  # Dev Tools
  packages += 'docker pyenv nvm'

  # Terminal Stuff
  packages += 'powerline nvim rxvt-unicode zsh'

  # Monitor Tools
  packages += 'autorandr arandr redshift'

  # Window Manager
  packages += 'bspwm sxhkd'

  # Ricing Tools
  packages += 'xorg-xrdb xorg-xinput xorg-xbacklight xorg-wininfo tabbed dunstify polybar'

  # Music
  packages += 'pulseaudio pulsemixer'

  # Aur Helper
  packages += 'yay'

  sudo pacman -Sy --noconfirm $packages
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
  cp -r fonts/SourceCodePro /usr/share/fonts
  cp fonts/icomoon-feather.ttf /usr/share/fonts
  cp fonts/Ubuntu-C.ttf /usr/share/fonts

  fc-cache -fv
}

install_packages
setup_spacevim
move_files
setup_fonts
change_shell
