#bin/sh

# remove something for bitmap fonts to work
rm /etc/fonts/conf.d/70-droid-sans-mono.conf

# Install nerd fonts
sudo pacman -S ttf-hack
