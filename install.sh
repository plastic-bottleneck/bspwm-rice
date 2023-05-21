#!/bin/bash

# welcome
echo
echo "################################################"
echo "# Welcome to Paul's BSPWM Rice for Arch Linux! #"
echo "################################################"
echo
echo "Feel free to modify it for your likes!"
echo

# yay
echo
echo "##################"
echo "# Installing yay #"
echo "##################"
echo
sudo pacman -S git && mkdir ~/git && cd ~/git && git clone https://aur.archlinux.org/yay && cd yay && sudo makepkg -si && cd
echo
echo "Done!"
echo

# software and fonts
echo
echo "#################################"
echo "# Installing software and fonts #"
echo "#################################"
echo
cd $HOME && mkdir pix doc dow 
yay -S enchant mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk ttf-gentium languagetool libmythes bspwm xorg xorg-server xorg-xinit sxhkd htop thunar alacritty feh picom polybar vim vi ed noto-fonts noto-fonts-emoji flameshot mpv links ttf-font-awesome pipewire lib32-pipewire pipewire-audio pipewire-alsa alsa-utils alsa-plugins pipewire-pulseaudio firefox arandr lf ttf-jetbrains-mono-nerd nerdfetch ufw python python3 python-pip papirus-folders-catppuccin-git catppuccin-cursors-mocha catppuccin-cursors-macchiato catppuccin-cursors-frappe catppuccin-cursors-latte catppuccin-gtk-theme-mocha catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte gvfs tumbler ffmpegthumbnailer thunar-volman thunar-shares-plugin wget dunst
sudo ufw enable					# firewall	- ufw : enable
sudo systemctl enable ufw.service 		# firewall	- ufw
sudo systemctl enable pipewire.service		# audio 	- pipewire
sudo systemctl enable pipewire-pulse.service	# audio 	- pipewire for pulseaudio
sudo systemctl enable wireplumber.service	# audio 	- wireplumber
echo
echo "Done!"
echo

# configs
echo
echo "######################"
echo "# Installing configs #"
echo "######################"
echo
cd ~/git && git clone https://github.com/plastic-bottleneck/bashrc && cd bashrc && chmod +x install-arch.sh && ./install-arch.sh && cd
cd $HOME/bspwm-rice/src && cp -r alacritty $HOME/.config && cp -r bspwm $HOME/.config/ && cp -r dunst $HOME/.config/ && cp -r picom $HOME/.config/ && cp -r polybar $HOME/.config/ && cp -r sxhkd $HOME/.config/ && cp xinitrc $HOME/.xinitrc && cp Xresources $HOME/.Xresources && cp gtk-3.0/settings.ini $HOME/.config/gtk-3.0 && cp -r wal $HOME/pix
echo
echo "Done!"
echo

# finish
echo
echo "#############"
echo "# Finishing #"
echo "#############"
echo
yay && yay -Rcsdd
mv bspwm-rice git
echo
echo "Done!"
echo
nerdfetch
echo
echo "You can reboot now if you want and have fun :)"
echo
