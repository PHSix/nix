sudo rm -rf /etc/nixos/
sudo rsync -avz . /etc/nixos/
sudo nixos-rebuild build
