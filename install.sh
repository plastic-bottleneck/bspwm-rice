#!/bin/bash

# // welcome to this little install script for my bspwm rice! //
echo
echo "################################################"
echo "# Welcome to Paul's BSPWM Rice for Arch Linux! #"
echo "################################################"
echo
echo "Feel free to modify it for your likes!"
echo

# // yay //
echo
echo "##################"
echo "# Installing yay #"
echo "##################"
echo

sudo pacman -Syu                                                                                                # updateing the system
mkdir $HOME/git && cd $HOME/git && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd   # installing yay

echo
echo "Done!"
echo

# // software and fonts //
echo
echo "#################################"
echo "# Installing software and fonts #"
echo "#################################"
echo

cd $HOME && mkdir pix doc dow         # making home directories for files etc 

yay -S enchant mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk ttf-gentium languagetool libmythes bspwm xorg xorg-server xorg-xinit sxhkd htop thunar alacritty feh picom polybar vim vi ed noto-fonts noto-fonts-emoji flameshot mpv links ttf-font-awesome pipewire lib32-pipewire pipewire-audio pipewire-alsa alsa-utils alsa-plugins pipewire-pulseaudio firefox arandr lf ttf-jetbrains-mono-nerd nerdfetch ufw python python3 python-pip papirus-folders-catppuccin-git catppuccin-cursors-mocha catppuccin-cursors-macchiato catppuccin-cursors-frappe catppuccin-cursors-latte catppuccin-gtk-theme-mocha catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte gvfs tumbler ffmpegthumbnailer thunar-volman thunar-shares-plugin wget dunst

sudo ufw enable					              # firewall	- ufw : enable
sudo systemctl enable ufw.service 		# firewall	- ufw

echo
echo "Done!"
echo

# // configs //
echo
echo "######################"
echo "# Installing configs #"
echo "######################"
echo

cd ~/git && git clone https://github.com/plastic-bottleneck/bashrc && cd bashrc && chmod +x install-arch.sh && bash install-arch.sh && cd # installing my custom bashrc config

cd $HOME/bspwm-rice/src                                                                         # moving into the source folder to get the configs

cp -r rofi $HOME/git/                                                                           # rofi (launcher)
mkdir $HOME/.config/rofi/ && cp -r rofi-config/* $HOME/.config/rofi/                            # rofi config (launcher config)
cp -r alacritty $HOME/.config && cp -r bspwm $HOME/.config/                                     # alacritty config (terminal)
cp -r dunst $HOME/.config/                                                                      # dunst config (for notifications)
cp -r picom $HOME/.config/                                                                      # picom config (compositor)
cp -r polybar $HOME/.config/                                                                    # polybar config (bar)
cp -r sxhkd $HOME/.config/                                                                      # sxhkd config (keybindings)
cp xinitrc $HOME/.xinitrc                                                                       # xinitrc file for xorg
cp Xresources $HOME/.Xresources                                                                 # Xresources (catppuccin curser)
sudo rm $HOME/.config/gtk-3-0/settings.ini && cp gtk-3.0/settings.ini $HOME/.config/gtk-3.0/    # gtk theme
cp -r wal $HOME/pix/                                                                            # wallpaper
sudo cp pacman.conf /etc/pacman.conf                                                            # pacman config

echo
echo "Done!"
echo

# // finish //
echo
echo "#############"
echo "# Finishing #"
echo "#############"
echo

yay && yay -Scc     # cleaning up yay cache

mv bspwm-rice git   # moving this dir into ~/git/

echo
echo "Done!"
echo

nerdfetch           # system info

echo
echo "You can reboot now if you want and have fun :)"
echo "Remember, to start bspwm type `startx` inside your tty!"
echo
