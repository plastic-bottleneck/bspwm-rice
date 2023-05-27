#!/bin/bash
clear

# // welcome to this little install script for my bspwm rice! //
cat $HOME/bspwm-rice/msg.txt

echo && echo
echo "Welcome to Paul's BSPWM Rice for Arch Linux!"
echo "Feel free to modify it for your likes!"
echo

# // yay //
echo
echo "##################"
echo "# Installing yay #"
echo "##################"
echo

sudo pacman -Syu										# updateing the system
mkdir $HOME/git
cd $HOME/git && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd	# installing yay

echo
echo "Done!"
echo

# // software and fonts //
echo
echo "#################################"
echo "# Installing software and fonts #"
echo "#################################"
echo

cd $HOME 
mkdir pix doc dow				# making home directories for files etc 

yay -S wine dosbox cups sane libgphoto2 lib32-sdl2 lib32-gst-plugins-base-libs lib32-libxinerama lib32-libxcomposite lib32-libpulse lib32-v4l-utils lib32-gnutls lib32-giflib backlight_control ttf-ms-fonts lib32-pipewire enchant libreoffice-fresh thunderbird rofi pulseaudio mythes-en ttf-liberation hunspell-en_US ttf-bitstream-vera man-db wireplumber pipewire-jack pkgstats adobe-source-sans-pro-fonts gst-plugins-good ttf-droid ttf-dejavu aspell-en icedtea-web gst-libav ttf-ubuntu-font-family ttf-anonymous-pro jre8-openjdk languagetool libmythes bspwm xorg xorg-server xorg-xinit sxhkd htop thunar alacritty feh picom polybar vim vi ed noto-fonts noto-fonts-emoji flameshot mpv links ttf-font-awesome pipewire lib32-pipewire-jack pipewire-audio pipewire-alsa alsa-utils alsa-plugins firefox arandr lf ttf-jetbrains-mono-nerd nerdfetch ufw python python3 python-pip papirus-folders-catppuccin-git catppuccin-cursors-mocha catppuccin-cursors-macchiato catppuccin-cursors-frappe catppuccin-cursors-latte catppuccin-gtk-theme-mocha catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte gvfs tumbler ffmpegthumbnailer thunar-volman thunar-shares-plugin wget dunst

sudo ufw enable					# firewall	- ufw : enable
sudo systemctl enable ufw.service		# firewall	- ufw

echo
echo "Done!"
echo

# // configs //
echo
echo "######################"
echo "# Installing configs #"
echo "######################"
echo

cd $HOME/git
git clone https://github.com/plastic-bottleneck/bashrc						# cloning into my bashrc git repo
cd bashrc 
chmod +x install-arch.sh && bash install-arch.sh && cd						# installing my bashrc config

cd $HOME/bspwm-rice/src                                                                         # moving into the source folder to get the configs
cp -r rofi $HOME/git/                                                                           # rofi (launcher)
chmod +x $HOME/git/rofi/basic/install.sh && bash $HOME/git/rofi/basic/install.sh		# rofi theme (install)
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
sudo cp -r ComicMono /usr/share/fonts/                                                          # installing font (comic mono)

echo
echo "Done!"
echo

# // finish //
echo
echo "#############"
echo "# Finishing #"
echo "#############"
echo

yay && yay -Scc					# cleaning up yay cache

sudo chmod 755 $HOME/.config/bspwm/bspwmrc	# making the bspwm config file useable (755)
sudo chmod 644 $HOME/.config/sxhkd/sxhkdrc	# making the sxhkd config file useable (644)

echo
echo "Done!"
echo

nerdfetch					# print system info

echo
echo "You can reboot now if you want and have fun :)"
echo "Remember, to start bspwm, type startx inside your tty!"
echo
echo "Leave a star on my GitHub: https://github.com/plastic-bottleneck/"
echo "Or visit my website at: http://plastic-bottleneck.42web.io/"
echo
