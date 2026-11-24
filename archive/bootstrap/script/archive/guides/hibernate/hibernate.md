https://ubuntuhandbook.org/index.php/2021/08/enable-hibernate-ubuntu-21-10/
https://askubuntu.com/questions/1240123/how-to-enable-the-hibernate-option-in-ubuntu-20-04

# install dependencies

# get swap info

get UUID of swap partition
OR
get UUID and offset of swapfile

# update Grub

sudo nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=<SWAP_UUID> resume_offset=<SWAPFILE_OFFSET>"

sudo update-grub

# test

sudo systemctl hibernate

# GNOME integration

https://extensions.gnome.org/extension/755/hibernate-status-button/