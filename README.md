https://www.youtube.com/watch?v=gIDywsGBqf4

https://github.com/LearnLinuxTV/ansible_desktop_tutorial
https://github.com/LearnLinuxTV/personal_ansible_desktop_configs


# serves one bash script
curl deploy/boostrap | sudo bash

## install ansible
sudo apt install python3-pip
pip3 install ansible

run ansible-pull -i pop-os, --vault-password-file /etc/ansible_vault_key -U https://gitlab+deploy-xxxxxxxxx@gitlab.com/xxxxxx/ansible.git

# Run pull

ansible-pull \
    --inventory inventory.ini \
    --url ssh://git@gitea.bremme.nl:30023/bremme/ansible-machines.git \
    --ask-become-pass \
    local.yml

# Run local

ansible-playbook \
    --inventory inventory.ini \
    --limit carbon.bremme.nl \
    --ask-become-pass \
    --connection local \
    local.yml

# Run remote

# Questions

check hostname

# Bootstrapping



install ansible
    sudo apt install python3-pip
    python3 -m pip install --user ansible
    export PATH="$HOME/.local/bin:$PATH"

sudo apt install git openssh-client


ssh-keygen -t ed25519 -a 64 -C "$USER@$HOSTNAME"
cat .ssh/id_ed25519.pub

generate ssh key
add to gitea
install zsh
change default shell

generate ssh key
add ssh key to gitea, gogs, github

# application preference

deb if kept up-to-date

snap

flatpack

appimage

custom


# TODO

Starship! (snap, homebrew)
yq (snap, homebrew)
keep precense (only snap? )

Citrix receiver
Displaylink driver

bluetooth devices
accesspoints

remove all custom keybings


difference between work and private use
work:       teams, citrix
private:    cura, arduino