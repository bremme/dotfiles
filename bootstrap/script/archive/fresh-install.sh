#!/usr/bin/env bash

# Start
source $(dirname "$0")/scripts/utils.sh

log_info "Start fresh installation"

log_info "Update packages"
sudo apt update

# Essential (shell) tools ##############################################################
log_info "Start installing Essentials"

if [ $(confirm "Do you want to install 'essentials'?") = true ]; then
    $(dirname "$0")/scripts/install/install_essentials.sh
    $(dirname "$0")/scripts/install/install_git.sh
    $(dirname "$0")/scripts/install/install_ohmyzsh.sh
    if [ $(confirm "Do you want to install 'starship'?") = true ]; then
        $(dirname "$0")/scripts/install/install_starship.sh
    fi
    $(dirname "$0")/scripts/install/install_homeshick.sh
fi

# ## Development tools ##################################################################
log_info "Start installing Development tools"

if [ $(confirm "Do you want to install 'Visual Studio Code'?") = true ]; then
    $(dirname "$0")/scripts/install/install_vscode.sh
fi

if [ $(confirm "Do you want to install 'PyEnv'?") = true ]; then
    $(dirname "$0")/scripts/install/install_pyenv.sh
fi

if [ $(confirm "Do you want to install 'PlatformIO'?") = true ]; then
    $(dirname "$0")/scripts/install/install_pio.sh
fi

if [ $(confirm "Do you want to install 'Arduino IDE'?") = true ]; then
    $(dirname "$0")/scripts/install/install_arduino.sh
fi

# Desktop productivity ################################################################
if [ $(confirm "Do you want to install 'Essentials GUI'") == true ]; then
    $(dirname "$0")/scripts/install/install_essentials_gui.sh
fi

if [ $(confirm "Do you want to apply Gnome gsettings") == true ]; then
    $(dirname "$0")/scripts/apply.gsettings.sh
fi

# reduce swapiness (when you have a lot of ram)
if [ $(confirm "Do you want to change vm.swappiness") == true ]; then
    echo "What value do you want to apply?"
    read value
    echo "Going to change vm.swappiness to '$value'"
    # if already set
    if grep -q vm.swappiness "/etc/sysctl.conf"; then
        sudo sed -i "/vm.swappiness/c\vm.swappiness = $value" /etc/sysctl.conf
    else
        sudo bash -c "echo 'vm.swappiness = $value' >> /etc/sysctl.conf"
    fi
    sudo sysctl vm.swappiness=5
fi


# Set up lm-sensors TODO
# sudo apt install lm-sensors
# sudo sensors-detect

# Gnome extensions
# Freon: https://extensions.gnome.org/extension/841/freon/
# OpenWeather: https://extensions.gnome.org/extension/750/openweather/
# system-monitor: https://extensions.gnome.org/extension/120/system-monitor/
# cpufreq: https://extensions.gnome.org/extension/1082/cpufreq/