############
### ARCH ###
############
ARCH() {
  # system optimization script - https://bbs.archlinux.org/viewtopic.php?id=93683
  # pacman tips / tricks - https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks
  # improve performance - https://wiki.archlinux.org/index.php/improving_performance
  # sync & backup - https://wiki.archlinux.org/index.php/Synchronization_and_backup_programs
  # newbie corner - https://bbs.archlinux.org/viewforum.php?id=23

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
  # security management - https://wiki.debian.org/SecurityManagement
  # securrity manual - https://www.debian.org/doc/manuals/securing-debian-manual/index.en.html

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
FEDORA() {
  # security guide - https://docs.fedoraproject.org/en-US/Fedora/17/html-single/Security_Guide/index.html
  # best practices - https://docs.fedoraproject.org/en-US/Fedora_Draft_Documentation/0.1/html/RPM_Guide/ch13s02.html

  sudo dnf update -y
  sudo dnf upgrade -y # redundant for update???
  sudo dnf install ...
  sudo dnf remove texlive* # * is wildcard character
  sudo dnf clean all # removes cache
}

CLAMAV() {
  sudo freshclam # updates clam virus database
  sudo clamscan -r --remove / # full system scan, remove infected files

  # clamav system scan & email automation script
  # add to file, run file in CRON
  # https://www.lisenet.com/2014/automate-clamav-to-perform-daily-system-scan-and-send-email-notifications-on-linux

  LOGFILE="/var/log/clamav/clamav-$(date +'%Y-%m-%d').log";
  EMAIL_MSG="Please see the log file attached.";
  EMAIL_FROM="clamav-daily@example.com";
  EMAIL_TO="username@example.com";
  DIRTOSCAN="/home";

  # Update ClamAV database
  echo "Looking for ClamAV database updates...";
  freshclam --quiet;

  TODAY=$(date +%u);

  if [ "$TODAY" == "6" ];then
   echo "Starting a full weekend scan.";

   # be nice to others while scanning the entire root
   nice -n5 clamscan -ri / --exclude-dir=/sys/ &>"$LOGFILE";
  else
   DIRSIZE=$(du -sh "$DIRTOSCAN" 2>/dev/null | cut -f1);

   echo "Starting a daily scan of "$DIRTOSCAN" directory.
   Amount of data to be scanned is "$DIRSIZE".";

   clamscan -ri "$DIRTOSCAN" &>"$LOGFILE";
  fi

  # get the value of "Infected lines"
  MALWARE=$(tail "$LOGFILE"|grep Infected|cut -d" " -f3);

  # if the value is not equal to zero, send an email with the log file attached
  if [ "$MALWARE" -ne "0" ];then
    #using heirloom-mailx below
    echo "$EMAIL_MSG"|mail -a "$LOGFILE" -s "Malware Found" -r "$EMAIL_FROM" "$EMAIL_TO";
  fi
  exit 0
}
