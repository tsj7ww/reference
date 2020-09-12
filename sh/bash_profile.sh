# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# miniconda into PATH
export PATH="/home/tsj7ww/miniconda3/bin:$PATH"

################
### Env Vars ###
################
export PATH="$PATH"
export USR='tsj7ww'
export USR_NM="Trevor Jordan"
# dates
export TODAY=$(date '+%Y%m%d')
export DTTM=$(date '+%Y-%m-%d %H:%M:%S')
export YEST=$(date --date='1 day ago')
# dirs
export DIR_DATA=""
export DIR_LOGS=""
export EXT_DRIVE="/media/TSJDEV"
export AIRFLOW="$EXT_DRIVE/airflow"
# email
export EML_USR="username@gmail.com"
export EML_SHARED="shared_inbox.gmail.com"
export EML_PWD=""
export EML_SVR="smtp.gmail.com"
export EML_PORT=587
# db
export DB_ACCT=""
export DB_URL=""
export DB_WH=""
export DB_DB=""
export DB_SCMA=""
# aws
export AWS_KEYS="${HOME}/AWS/keys"
export EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
export EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed 's/[a-z]$//'`"
export S3_USEAST1=""
export S3_USWEST2=""

################
### TEMPLATE ###
###############
# OPTIONS
export GREP_OPTIONS=' — color=auto'
export EDITOR=vim
# SERVERS
alias myec2box='ssh tsj7ww@aws'
alias mypi='ssh tsj7ww@192.168.86.87'
alias pythonserver='python -m SimpleHTTPServer 8000'
# ALIAS
alias q='exit'
alias c='clear'
alias h='history'
alias cs='clear;ls'
alias p='cat'
alias pd='pwd'
alias lsa='ls -a'
alias lsl='ls -l'
alias t='time'
alias k='kill'
alias null='/dev/null'
# CMDS
alias vimbp='vim ~/.bash_profile'
alias srcbp='source ~/.bash_profile'
alias catbp='cat ~/.bash_profile'
alias vimcron='crontab -e'
alias catcron='crontab -l'
# DIR
alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias dbox='cd ~/Dropbox'
alias gdrive='cd ~/Google\ Drive'
# Common project directories
alias cppprojects='cd ~/Dropbox/Projects/C++Projects'
alias pythonprojects='cd ~/Dropbox/Projects/PythonProjects'
alias goprojects='cd ~/Dropbox/Projects/GoProjects'
alias rustprojects='cd ~/Dropbox/Projects/RustProjects'
# BASICS
alias o=open
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
# GIT
alias g='git'
alias st='git status'
alias com='git commit -m'
alias clone='git clone'
alias sth='git stash'
alias lg='git log'
alias u='git add -u'
alias all='git add .'
# PROGRAMS
alias gcc='gcc-6'
alias g++='g++-6'
alias tar='gtar'
alias python='python3'
alias pip='pip3'
