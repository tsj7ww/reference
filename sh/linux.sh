############
### ARCH ###
############
ARCH() {
  #!/bin/bash
  tar -cjf /store/bak/pacman-database.tar.bz2 /var/lib/pacman/local
  pacman -Rscn $(pacman -Qtdq)
  pacman -Sc
  pacman-optimize && sync
  updatedb

  exit 0
}

##############
### DEBIAN ###
##############
DEBIAN() {
  aptitude update
  aptitude full-upgrade
  # apt
  sudo apt update -y
  sudo apt-get dist-upgrade -y
  sudo apt autoremove
  # list packages
  dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | tail 20
}

##############
### FEDORA ###
##############
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install ...
sudo dnf remove
sudo dnf clean
