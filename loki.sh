### elementary OS Loki 0.4 ###

#!/bin/bash
sudo sed -i 's/loki/xenial/g' /etc/apt/sources.list.d/elementary.list /etc/apt/sources.list.d/patches.list
sudo apt-get update
sudo apt-get install nimf git software-properties-common gdebi -y
im-config -n nimf
gsettings set org.gnome.settings-daemon.plugins.media-keys email "'F4'"
gsettings set org.gnome.settings-daemon.plugins.media-keys next "'F10'"
gsettings set org.gnome.settings-daemon.plugins.media-keys previous "'F9'"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['F11']"
git clone https://github.com/bagjunggyu/alias.git;mv alias/.bash_aliases .;rm -rf alias

if [ $UID -ne 0 ]; then
    sudo $0
else
    apt-get autoremove --purge -y
    apt-get dist-upgrade -y;
    apt-add-repository ppa:philip.scott/elementary-tweaks -y
    apt-get update
    apt-get install nimf elementary-tweaks -y
    apt-get autoremove fonts-nanu* fonts-unfon* -y
    apt-get autoclean;apt-get clean
    rm -rf .local/share/scratch-text-editor/
    rm /etc/apt/sources.list.d/philip*
    apt-get update
    rm loki.sh
    reboot
fi

exit 0
