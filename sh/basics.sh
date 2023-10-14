########################
### Missing Semester ###
########################
foo=bar # foo = bar won't work - spaces split arguments in shell
echo "Value is $foo"
echo 'Values is $foo' # literal
mcd () {
  mkdir -p "$1"
  cd "$1"
}
source filename.sh # creates vars
echo $_ # previous last argument
!! # previous line
$? # error value of previous line - 1 = False = Error
false || echo "print this" # do 1st command if true, else do 2nd
true || echo "not printed"
true && echo "print this"
false && echo "not printed"
echo "cmd 1"; echo "cmd 2"
foo=$(pwd)
echo "we are in $foo = $(pwd)"
cat <(ls) <(ls ..) # multiple arguments
$0 # name of script
$# # number of arguments
$$ # process id of current process
$@ # expands to all of the ags - like *args
grep foobar "hellfoorbaro" > /dev/null 2> /dev/null # redirect output to null
ls *.sh # match any char
touch hello.{txt,md} # run multiple options
diff $1 $2 # find the difference between two inputs
python file.py # 1st line > #!/usr/bin/env python -> specify path for interpretation
shellcheck shellfile.sh # checks for shell issues
man zip # gives manual of shell tools
find /dir/ -name src -type d -exec execute this # find src dirs in /dir and below
fd ".*py" # find shortened
locate tsj7ww # finds dirs with that name
grep foobar mcd.sh
grep -R foodbar /dir/ # recursive
rg "import requests" -t py -c 5 /dir/ # 5 lines of context
rg -u --files-without-match "^#\!" -t sh
tree /dir/ # visual tree rep of dirs
broot  # gives condensed, interactive directory listings
nnn # very interactive folder navigation
alias name="command" # create command with input varname

###################
### JOB CONTROL ###
###################
sleep 20 # ^C -> signals interrupt with SIGINT
man signal #
# import signal \ def handler(signum, time): print("Got SIGINT, continuing.")
# signal.signal(signal.SIGINT, handler) -> handler SIGINT
nohup sleep 2000 & # sleep for 2k secs in background + ignore hangup
jobs # list jobs
bg %1 # bring pid=1 to background
fg %1 # bring pid=1 to foreground
kill -STOP %1 # send stop signal to pid

#################
### DOT FILES ###
#################
# env configuration files
cat ~/.vimrc
cat ~/.bashrc
cat ~/.bash_profile
# symlinks - file symbolic link to file in another location