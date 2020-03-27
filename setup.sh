sudo pacman -S powerline \
	  docker \
	  redshift \
	  arandr \
	  autorandr \
	  poetry \
	  xorg-xrdb \
	  polybar \
    xorg-xinput \
    xorg-xbacklight \
    nvim \
  
# Install spacevim
SPACEVIM_FILE="$HOME/.SpaceVim.d/init.toml"

if [ -f "$SPACEVIM_FILE" ]; then
    echo "$SPACEVIM_FILE exist"
else
    echo "$SPACEVIM_FILE does not exist"
    curl -sLf https://spacevim.org/install.sh | bash
    # Lsp
    npm install -g javascript-typescript-langserver
    pip install --user python-language-server

    # Python dep
    pip install --user flake8
    pip install --user yapf
fi


#cat <<EOT >> ~/.bashrc
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
#EOT
