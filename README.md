https://www.youtube.com/watch?v=gIDywsGBqf4

https://github.com/LearnLinuxTV/ansible_desktop_tutorial
https://github.com/LearnLinuxTV/personal_ansible_desktop_configs


# serves one bash script
curl deploy/boostrap | sudo bash

## install ansible
sudo apt install python3-pip
pip3 install ansible

sudo apt install ansible ansible-lint cowsay

run ansible-pull -i pop-os, --vault-password-file /etc/ansible_vault_key -U https://gitlab+deploy-xxxxxxxxx@gitlab.com/xxxxxx/ansible.git

# Install dependencies

```shell
ansible-galaxy collection install -r requirements.yaml
```

# Run pull

ansible-pull \
    --inventory inventory.ini \
    --url ssh://git@gitea.bremme.nl:30023/bremme/ansible-machines.git \
    --ask-become-pass \
    local.yml

# Run local

ansible-playbook \
    --inventory inventory.ini \
    --limit oxygen.bremme.nl \
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


* deb if kept up-to-date
* flatpack
* snap
* appimage
* tar.gz / binairy etc.


# TODO


* software
  * syncthing
  * nextcloud
  * Teamviewer / Rustdesk
  * Displaylink driver
  * Citrix workspace
  * Cura
  * IntelliJ
  * VS Code
  * kubeseal
  * Camunda
    * fix links
    * fix plugin links
    * run xdg_register
  * sdkman ?
  * angular ?
  * mongo client / compas
  * nemo bookmarks
  * us international with dead keys
* system
  * swapiness lower
  * hibernation
  * hybrid sleep
* restore backup
  * bluetooth devices
  * accesspoints

kubeseal
oc
netscaler-proxy
netscaler-proxy-manual

github signed commits


difference between work and private use
work:       teams, citrix
private:    cura, arduino

# Manual actions

sign in to Firefox sync
    customize toolbar -> remove white spaces
    remove imported bookmarks etc.
    Open about:config and set browser.tabs.insertAfterCurrent to true.

    services.sync.prefs.sync.browser.tabs.insertAfterCurrent
    It is probably possible to sync about:config settings https://support.mozilla.org/en-US/kb/sync-custom-preferences#
    Maybe this services.sync.prefs.dangerously_allow_arbitrary is also required?


    this is the whitelist: services.sync.prefs.sync

# Create swap file

dd if=/dev/zero of=/swapfile bs=1M count=32k status=progress
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

/etc/fstab

```shell
# <file system>   <mount point>   <type>  <options>   <dump> <pass>
/swapfile         none            swap    sw          0       0
```

echo "vm.swappiness=10" >> /etc/sysctl.conf

https://wiki.debian.org/Hibernation/Hibernate_Without_Swap_Partition



# Laptop

laptop-mode-tool
Laptop Mode Tools
https://wiki.archlinux.org/title/Laptop_Mode_Tools
https://github.com/rickysarraf/laptop-mode-tools

TLP - https://linrunner.de/tlp/


powertop
auto cpu freq

indicator-cpufreq

thermald (intel only?)

amd_pstate?

## CPU frequency scaling

https://wiki.archlinux.org/title/CPU_frequency_scaling

Enable amd_pstate


This all seems realted to the GNOME profile switching, not sure what it actually does?

power-profiles-daemon
powerprofilesctl get

