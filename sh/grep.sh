############
### GREP ###
############
# cheatsheet - https://staff.washington.edu/weller/grep.html
# basics
grep 'word' filename
fgrep 'word-to-search' file.txt
grep 'word' file1 file2 file3
grep 'string1 string2'  filename
cat otherfile | grep 'something'
command | grep 'something'
command option1 | grep 'data'
grep --color 'data' fileName
grep [-options] pattern filename
fgrep [-options] words file
# options
grep -r "192.168.1.5" /etc/ # recursive
grep -h "192.168.1.5" /etc/ # no file names
grep -w "boo" file # words
grep -i 'bar' /path/to/file# ignore case
# invert
grep -v bar /path/to/file
grep -v '^root' /etc/passwd
# colors
GREP_COLOR='1;35' grep --color=always 'vivek' /etc/passwd
GREP_COLOR='1;32' grep --color=always 'vivek' /etc/passwd
GREP_COLOR='1;37' grep --color=always 'root' /etc/passwd
GREP_COLOR='1;36' grep --color=always nobody /etc/passwd