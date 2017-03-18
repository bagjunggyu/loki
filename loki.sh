### elementary OS 0.4 Loki ###

#!/bin/bash
sudo sed -i 's/loki/xenial/g' /etc/apt/sources.list.d/elementary.list /etc/apt/sources.list.d/patches.list
sudo apt-get update
sudo apt-get install nimf software-properties-common gdebi gparted gnome-disk-utility firefox firefox-locale-ko tilda dconf-editor -y
sudo apt-get remove epiphany-browser -y
im-config -n nimf
gsettings set org.gnome.settings-daemon.plugins.media-keys email "'F4'"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "'F10'"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous "'F9'"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F11']"
cd && wget https://github.com/bagjunggyu/alias/archive/master.zip
unzip master.zip && mv ~/alias-master/.bash_aliases . && rm master.zip && rm -r ~/alias-master
sudo apt-get autoremove --purge -y
sudo apt-get dist-upgrade -y;
sudo apt-add-repository ppa:philip.scott/elementary-tweaks -y
sudo apt-get update
sudo apt-get install elementary-tweaks -y
sudo apt-get autoremove fonts-nanu* fonts-unfon* -y
sudo apt-get autoclean;apt-get clean
sudo rm -rf .local/share/scratch-text-editor/
sudo rm /etc/apt/sources.list.d/philip*
sudo apt-get update
sudo rm loki.sh
sudo reboot
