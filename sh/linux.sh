##############
### DEBIAN ###
##############
# aptitude
aptitude update
aptitude full-upgrade
# apt
sudo apt update -y
sudo apt-get dist-upgrade -y
sudo apt autoremove
# list packages
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | tail 20

##############
### FEDORA ###
##############
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install ...
sudo dnf remove
sudo dnf clean
