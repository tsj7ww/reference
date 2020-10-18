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

###########
### GIT ###
###########
# cheatsheet - https://education.github.com/git-cheat-sheet-education.pdf
# Configuration
git config user.name "My Name"
git config user.email "myemail@domain.com"
# Initialize a git repository
git init
# Add all files to be commited
git add .
# Add one file to be commited
git add -- name_of_file.ext
# Add all files inside one folder to be commited
git add -- name_of_folder
# Commit
git commit -m 'Commit description'
# Update local repository from a remote (origin = remote name, master = branch name)
git pull origin master
# Send commit to a remote repository
git push origin master
# Clone a remote repository
git clone git@host:user/repository.git
# Show origin details (origin = remote name)
git remote show origin
# Create a branch
git checkout branch_to_be_copied
git checkout -b branch_name
# Merge branches
git checkout branch_to_receive_merge
git merge branch_to_be_merged
# Undo all changes
git checkout .
# Undo changes in specific file
git checkout -- file_name.ext
# Undo commit definetelly
git reset --hard hash_to_commit_or_branch
# Finding the guilty
git blame filename.ext
# Checking steps
git reflog
# Checking commits
git log
# git diff
git diff <path>
git diff --cached <path>
git diff HEAD <path>
git diff HEAD^ HEAD <path>


#############
### RegEx ###
#############
# cheatsheet - https://www.rexegg.com/regex-quickstart.html
# basics

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


#######################
### REMOTE MACHINES ###
#######################
ssh user@ip.addr.ess

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

###########
### AWK ###
###########
# cheatsheet - https://www.shortcutfoo.com/app/dojos/awk/cheatsheet
# FILE SPACING:
 # double space a file
 awk '1;{print ""}'
 awk 'BEGIN{ORS="\n\n"};1'
 # double space a file which already has blank lines in it. Output file
 # should contain no more than one blank line between lines of text.
 # NOTE: On Unix systems, DOS lines which have only CRLF (\r\n) are
 # often treated as non-blank, and thus 'NF' alone will return TRUE.
 awk 'NF{print $0 "\n"}'
 # triple space a file
 awk '1;{print "\n"}'
# NUMBERING AND CALCULATIONS:
 # precede each line by its line number FOR THAT FILE (left alignment).
 # Using a tab (\t) instead of space will preserve margins.
 awk '{print FNR "\t" $0}' files*
 # precede each line by its line number FOR ALL FILES TOGETHER, with tab.
 awk '{print NR "\t" $0}' files*
 # number each line of a file (number on left, right-aligned)
 # Double the percent signs if typing from the DOS command prompt.
 awk '{printf("%5d : %s\n", NR,$0)}'
 # number each line of file, but only print numbers if line is not blank
 # Remember caveats about Unix treatment of \r (mentioned above)
 awk 'NF{$0=++a " :" $0};1'
 awk '{print (NF? ++a " :" :"") $0}'
 # count lines (emulates "wc -l")
 awk 'END{print NR}'
 # print the sums of the fields of every line
 awk '{s=0; for (i=1; i<=NF; i++) s=s+$i; print s}'
 # add all fields in all lines and print the sum
 awk '{for (i=1; i<=NF; i++) s=s+$i}; END{print s}'
 # print every line after replacing each field with its absolute value
 awk '{for (i=1; i<=NF; i++) if ($i < 0) $i = -$i; print }'
 awk '{for (i=1; i<=NF; i++) $i = ($i < 0) ? -$i : $i; print }'
 # print the total number of fields ("words") in all lines
 awk '{ total = total + NF }; END {print total}' file
 # print the total number of lines that contain "Beth"
 awk '/Beth/{n++}; END {print n+0}' file
 # print the largest first field and the line that contains it
 # Intended for finding the longest string in field #1
 awk '$1 > max {max=$1; maxline=$0}; END{ print max, maxline}'
 # print the number of fields in each line, followed by the line
 awk '{ print NF ":" $0 } '
 # print the last field of each line
 awk '{ print $NF }'
 # print the last field of the last line
 awk '{ field = $NF }; END{ print field }'
 # print every line with more than 4 fields
 awk 'NF > 4'
 # print every line where the value of the last field is > 4
 awk '$NF > 4'
# STRING CREATION:
 # create a string of a specific length (e.g., generate 513 spaces)
 awk 'BEGIN{while (a++<513) s=s " "; print s}'
 # insert a string of specific length at a certain character position
 # Example: insert 49 spaces after column #6 of each input line.
 gawk --re-interval 'BEGIN{while(a++<49)s=s " "};{sub(/^.{6}/,"&" s)};1'
# ARRAY CREATION:
 # These next 2 entries are not one-line scripts, but the technique
 # is so handy that it merits inclusion here.
 # create an array named "month", indexed by numbers, so that month[1]
 # is 'Jan', month[2] is 'Feb', month[3] is 'Mar' and so on.
 split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", month, " ")
 # create an array named "mdigit", indexed by strings, so that
 # mdigit["Jan"] is 1, mdigit["Feb"] is 2, etc. Requires "month" array
 for (i=1; i<=12; i++) mdigit[month[i]] = i
# TEXT CONVERSION AND SUBSTITUTION:
 # IN UNIX ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format
 awk '{sub(/\r$/,"")};1'   # assumes EACH line ends with Ctrl-M
 # IN UNIX ENVIRONMENT: convert Unix newlines (LF) to DOS format
 awk '{sub(/$/,"\r")};1'
 # IN DOS ENVIRONMENT: convert Unix newlines (LF) to DOS format
 awk 1
 # IN DOS ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format
 # Cannot be done with DOS versions of awk, other than gawk:
 gawk -v BINMODE="w" '1' infile >outfile
 # Use "tr" instead.
 tr -d \r <infile >outfile            # GNU tr version 1.22 or higher
 # delete leading whitespace (spaces, tabs) from front of each line
 # aligns all text flush left
 awk '{sub(/^[ \t]+/, "")};1'
 # delete trailing whitespace (spaces, tabs) from end of each line
 awk '{sub(/[ \t]+$/, "")};1'
 # delete BOTH leading and trailing whitespace from each line
 awk '{gsub(/^[ \t]+|[ \t]+$/,"")};1'
 awk '{$1=$1};1'           # also removes extra space between fields
 # insert 5 blank spaces at beginning of each line (make page offset)
 awk '{sub(/^/, "     ")};1'
 # align all text flush right on a 79-column width
 awk '{printf "%79s\n", $0}' file*
 # center all text on a 79-character width
 awk '{l=length();s=int((79-l)/2); printf "%"(s+l)"s\n",$0}' file*
 # substitute (find and replace) "foo" with "bar" on each line
 awk '{sub(/foo/,"bar")}; 1'           # replace only 1st instance
 gawk '{$0=gensub(/foo/,"bar",4)}; 1'  # replace only 4th instance
 awk '{gsub(/foo/,"bar")}; 1'          # replace ALL instances in a line
 # substitute "foo" with "bar" ONLY for lines which contain "baz"
 awk '/baz/{gsub(/foo/, "bar")}; 1'
 # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
 awk '!/baz/{gsub(/foo/, "bar")}; 1'
 # change "scarlet" or "ruby" or "puce" to "red"
 awk '{gsub(/scarlet|ruby|puce/, "red")}; 1'
 # reverse order of lines (emulates "tac")
 awk '{a[i++]=$0} END {for (j=i-1; j>=0;) print a[j--] }' file*
 # if a line ends with a backslash, append the next line to it (fails if
 # there are multiple lines ending with backslash...)
 awk '/\\$/ {sub(/\\$/,""); getline t; print $0 t; next}; 1' file*
 # print and sort the login names of all users
 awk -F ":" '{print $1 | "sort" }' /etc/passwd
 # print the first 2 fields, in opposite order, of every line
 awk '{print $2, $1}' file
 # switch the first 2 fields of every line
 awk '{temp = $1; $1 = $2; $2 = temp}' file
 # print every line, deleting the second field of that line
 awk '{ $2 = ""; print }'
 # print in reverse order the fields of every line
 awk '{for (i=NF; i>0; i--) printf("%s ",$i);print ""}' file
 # concatenate every 5 lines of input, using a comma separator
 # between fields
 awk 'ORS=NR%5?",":"\n"' file
# SELECTIVE PRINTING OF CERTAIN LINES:
 # print first 10 lines of file (emulates behavior of "head")
 awk 'NR < 11'
 # print first line of file (emulates "head -1")
 awk 'NR>1{exit};1'
  # print the last 2 lines of a file (emulates "tail -2")
 awk '{y=x "\n" $0; x=$0};END{print y}'
 # print the last line of a file (emulates "tail -1")
 awk 'END{print}'
 # print only lines which match regular expression (emulates "grep")
 awk '/regex/'
 # print only lines which do NOT match regex (emulates "grep -v")
 awk '!/regex/'
 # print any line where field #5 is equal to "abc123"
 awk '$5 == "abc123"'
 # print only those lines where field #5 is NOT equal to "abc123"
 # This will also print lines which have less than 5 fields.
 awk '$5 != "abc123"'
 awk '!($5 == "abc123")'
 # matching a field against a regular expression
 awk '$7  ~ /^[a-f]/'    # print line if field #7 matches regex
 awk '$7 !~ /^[a-f]/'    # print line if field #7 does NOT match regex
 # print the line immediately before a regex, but not the line
 # containing the regex
 awk '/regex/{print x};{x=$0}'
 awk '/regex/{print (NR==1 ? "match on line 1" : x)};{x=$0}'
 # print the line immediately after a regex, but not the line
 # containing the regex
 awk '/regex/{getline;print}'
 # grep for AAA and BBB and CCC (in any order on the same line)
 awk '/AAA/ && /BBB/ && /CCC/'
 # grep for AAA and BBB and CCC (in that order)
 awk '/AAA.*BBB.*CCC/'
 # print only lines of 65 characters or longer
 awk 'length > 64'
 # print only lines of less than 65 characters
 awk 'length < 64'
 # print section of file from regular expression to end of file
 awk '/regex/,0'
 awk '/regex/,EOF'
 # print section of file based on line numbers (lines 8-12, inclusive)
 awk 'NR==8,NR==12'
 # print line number 52
 awk 'NR==52'
 awk 'NR==52 {print;exit}'          # more efficient on large files
 # print section of file between two regular expressions (inclusive)
 awk '/Iowa/,/Montana/'             # case sensitive
# SELECTIVE DELETION OF CERTAIN LINES:
 # delete ALL blank lines from a file (same as "grep '.' ")
 awk NF
 awk '/./'
 # remove duplicate, consecutive lines (emulates "uniq")
 awk 'a !~ $0; {a=$0}'
 # remove duplicate, nonconsecutive lines
 awk '!a[$0]++'                     # most concise script
 awk '!($0 in a){a[$0];print}'      # most efficient script


###########
### SED ###
###########
# cheatsheet - https://cheatsheet.dennyzhang.com/cheatsheet-sed-a4
# FILE SPACING:
 # double space a file
 sed G
 # double space a file which already has blank lines in it. Output file
 # should contain no more than one blank line between lines of text.
 sed '/^$/d;G'
 # triple space a file
 sed 'G;G'
 # undo double-spacing (assumes even-numbered lines are always blank)
 sed 'n;d'
 # insert a blank line above every line which matches "regex"
 sed '/regex/{x;p;x;}'
 # insert a blank line below every line which matches "regex"
 sed '/regex/G'
 # insert a blank line above and below every line which matches "regex"
 sed '/regex/{x;p;x;G;}'
# NUMBERING:
 # number each line of a file (simple left alignment). Using a tab (see
 # note on '\t' at end of file) instead of space will preserve margins.
 sed = filename | sed 'N;s/\n/\t/'
 # number each line of a file (number on left, right-aligned)
 sed = filename | sed 'N; s/^/     /; s/ *\(.\{6,\}\)\n/\1  /'
 # number each line of file, but only print numbers if line is not blank
 sed '/./=' filename | sed '/./N; s/\n/ /'
 # count lines (emulates "wc -l")
 sed -n '$='
# TEXT CONVERSION AND SUBSTITUTION:
 # IN UNIX ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format.
 sed 's/.$//'               # assumes that all lines end with CR/LF
 sed 's/^M$//'              # in bash/tcsh, press Ctrl-V then Ctrl-M
 sed 's/\x0D$//'            # works on ssed, gsed 3.02.80 or higher
 # IN UNIX ENVIRONMENT: convert Unix newlines (LF) to DOS format.
 sed "s/$/`echo -e \\\r`/"            # command line under ksh
 sed 's/$'"/`echo \\\r`/"             # command line under bash
 sed "s/$/`echo \\\r`/"               # command line under zsh
 sed 's/$/\r/'                        # gsed 3.02.80 or higher
 # IN DOS ENVIRONMENT: convert Unix newlines (LF) to DOS format.
 sed "s/$//"                          # method 1
 sed -n p                             # method 2
 # IN DOS ENVIRONMENT: convert DOS newlines (CR/LF) to Unix format.
 # Can only be done with UnxUtils sed, version 4.0.7 or higher. The
 # UnxUtils version can be identified by the custom "--text" switch
 # which appears when you use the "--help" switch. Otherwise, changing
 # DOS newlines to Unix newlines cannot be done with sed in a DOS
 # environment. Use "tr" instead.
 sed "s/\r//" infile >outfile         # UnxUtils sed v4.0.7 or higher
 tr -d \r <infile >outfile            # GNU tr version 1.22 or higher
 # delete leading whitespace (spaces, tabs) from front of each line
 # aligns all text flush left
 sed 's/^[ \t]*//'                    # see note on '\t' at end of file
 # delete trailing whitespace (spaces, tabs) from end of each line
 sed 's/[ \t]*$//'                    # see note on '\t' at end of file
 # delete BOTH leading and trailing whitespace from each line
 sed 's/^[ \t]*//;s/[ \t]*$//'
 # insert 5 blank spaces at beginning of each line (make page offset)
 sed 's/^/     /'
 # align all text flush right on a 79-column width
 sed -e :a -e 's/^.\{1,78\}$/ &/;ta'  # set at 78 plus 1 space
 # center all text in the middle of 79-column width. In method 1,
 # spaces at the beginning of the line are significant, and trailing
 # spaces are appended at the end of the line. In method 2, spaces at
 # the beginning of the line are discarded in centering the line, and
 # no trailing spaces appear at the end of lines.
 sed  -e :a -e 's/^.\{1,77\}$/ & /;ta'                     # method 1
 sed  -e :a -e 's/^.\{1,77\}$/ &/;ta' -e 's/\( *\)\1/\1/'  # method 2
 # substitute (find and replace) "foo" with "bar" on each line
 sed 's/foo/bar/'             # replaces only 1st instance in a line
 sed 's/foo/bar/4'            # replaces only 4th instance in a line
 sed 's/foo/bar/g'            # replaces ALL instances in a line
 sed 's/\(.*\)foo\(.*foo\)/\1bar\2/' # replace the next-to-last case
 sed 's/\(.*\)foo/\1bar/'            # replace only the last case
 # substitute "foo" with "bar" ONLY for lines which contain "baz"
 sed '/baz/s/foo/bar/g'
 # substitute "foo" with "bar" EXCEPT for lines which contain "baz"
 sed '/baz/!s/foo/bar/g'
 # change "scarlet" or "ruby" or "puce" to "red"
 sed 's/scarlet/red/g;s/ruby/red/g;s/puce/red/g'   # most seds
 gsed 's/scarlet\|ruby\|puce/red/g'                # GNU sed only
 # reverse order of lines (emulates "tac")
 # bug/feature in HHsed v1.5 causes blank lines to be deleted
 sed '1!G;h;$!d'               # method 1
 sed -n '1!G;h;$p'             # method 2
 # reverse each character on the line (emulates "rev")
 sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//'
 # join pairs of lines side-by-side (like "paste")
 sed '$!N;s/\n/ /'
 # if a line ends with a backslash, append the next line to it
 sed -e :a -e '/\\$/N; s/\\\n//; ta'
 # if a line begins with an equal sign, append it to the previous line
 # and replace the "=" with a single space
 sed -e :a -e '$!N;s/\n=/ /;ta' -e 'P;D'
 # add commas to numeric strings, changing "1234567" to "1,234,567"
 gsed ':a;s/\B[0-9]\{3\}\>/,&/;ta'                     # GNU sed
 sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'  # other seds
 # add commas to numbers with decimal points and minus signs (GNU sed)
 gsed -r ':a;s/(^|[^0-9.])([0-9]+)([0-9]{3})/\1\2,\3/g;ta'
 # add a blank line every 5 lines (after lines 5, 10, 15, 20, etc.)
 gsed '0~5G'                  # GNU sed only
 sed 'n;n;n;n;G;'             # other seds
# SELECTIVE PRINTING OF CERTAIN LINES:
 # print first 10 lines of file (emulates behavior of "head")
 sed 10q
 # print first line of file (emulates "head -1")
 sed q
 # print the last 10 lines of a file (emulates "tail")
 sed -e :a -e '$q;N;11,$D;ba'
 # print the last 2 lines of a file (emulates "tail -2")
 sed '$!N;$!D'
 # print the last line of a file (emulates "tail -1")
 sed '$!d'                    # method 1
 sed -n '$p'                  # method 2
 # print the next-to-the-last line of a file
 sed -e '$!{h;d;}' -e x              # for 1-line files, print blank line
 sed -e '1{$q;}' -e '$!{h;d;}' -e x  # for 1-line files, print the line
 sed -e '1{$d;}' -e '$!{h;d;}' -e x  # for 1-line files, print nothing
 # print only lines which match regular expression (emulates "grep")
 sed -n '/regexp/p'           # method 1
 sed '/regexp/!d'             # method 2
 # print only lines which do NOT match regexp (emulates "grep -v")
 sed -n '/regexp/!p'          # method 1, corresponds to above
 sed '/regexp/d'              # method 2, simpler syntax
 # print the line immediately before a regexp, but not the line
 # containing the regexp
 sed -n '/regexp/{g;1!p;};h'
 # print the line immediately after a regexp, but not the line
 # containing the regexp
 sed -n '/regexp/{n;p;}'
 # print 1 line of context before and after regexp, with line number
 # indicating where the regexp occurred (similar to "grep -A1 -B1")
 sed -n -e '/regexp/{=;x;1!p;g;$!N;p;D;}' -e h
 # grep for AAA and BBB and CCC (in any order)
 sed '/AAA/!d; /BBB/!d; /CCC/!d'
 # grep for AAA and BBB and CCC (in that order)
 sed '/AAA.*BBB.*CCC/!d'
 # grep for AAA or BBB or CCC (emulates "egrep")
 sed -e '/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d    # most seds
 gsed '/AAA\|BBB\|CCC/!d'                        # GNU sed only
 # print paragraph if it contains AAA (blank lines separate paragraphs)
 # HHsed v1.5 must insert a 'G;' after 'x;' in the next 3 scripts below
 sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;'
 # print paragraph if it contains AAA and BBB and CCC (in any order)
 sed -e '/./{H;$!d;}' -e 'x;/AAA/!d;/BBB/!d;/CCC/!d'
 # print paragraph if it contains AAA or BBB or CCC
 sed -e '/./{H;$!d;}' -e 'x;/AAA/b' -e '/BBB/b' -e '/CCC/b' -e d
 gsed '/./{H;$!d;};x;/AAA\|BBB\|CCC/b;d'         # GNU sed only
 # print only lines of 65 characters or longer
 sed -n '/^.\{65\}/p'
 # print only lines of less than 65 character
 sed -n '/^.\{65\}/!p'        # method 1, corresponds to above
 sed '/^.\{65\}/d'            # method 2, simpler syntax
 # print section of file from regular expression to end of file
 sed -n '/regexp/,$p'
 # print section of file based on line numbers (lines 8-12, inclusive)
 sed -n '8,12p'               # method 1
 sed '8,12!d'                 # method 2
 # print line number 52
 sed -n '52p'                 # method 1
 sed '52!d'                   # method 2
 sed '52q;d'                  # method 3, efficient on large files
 # beginning at line 3, print every 7th line
 gsed -n '3~7p'               # GNU sed only
 sed -n '3,${p;n;n;n;n;n;n;}' # other seds
 # print section of file between two regular expressions (inclusive)
 sed -n '/Iowa/,/Montana/p'             # case sensitive
# SELECTIVE DELETION OF CERTAIN LINES:
 # print all of file EXCEPT section between 2 regular expressions
 sed '/Iowa/,/Montana/d'
 # delete duplicate, consecutive lines from a file (emulates "uniq").
 # First line in a set of duplicate lines is kept, rest are deleted.
 sed '$!N; /^\(.*\)\n\1$/!P; D'
 # delete duplicate, nonconsecutive lines from a file. Beware not to
 # overflow the buffer size of the hold space, or else use GNU sed.
 sed -n 'G; s/\n/&&/; /^\([ -~]*\n\).*\n\1/d; s/\n//; h; P'
 # delete all lines except duplicate lines (emulates "uniq -d").
 sed '$!N; s/^\(.*\)\n\1$/\1/; t; D'
 # delete the first 10 lines of a file
 sed '1,10d'
 # delete the last line of a file
 sed '$d'
 # delete the last 2 lines of a file
 sed 'N;$!P;$!D;$d'
 # delete the last 10 lines of a file
 sed -e :a -e '$d;N;2,10ba' -e 'P;D'   # method 1
 sed -n -e :a -e '1,10!{P;N;D;};N;ba'  # method 2
 # delete every 8th line
 gsed '0~8d'                           # GNU sed only
 sed 'n;n;n;n;n;n;n;d;'                # other seds
 # delete lines matching pattern
 sed '/pattern/d'
 # delete ALL blank lines from a file (same as "grep '.' ")
 sed '/^$/d'                           # method 1
 sed '/./!d'                           # method 2
 # delete all CONSECUTIVE blank lines from file except the first; also
 # deletes all blank lines from top and end of file (emulates "cat -s")
 sed '/./,/^$/!d'          # method 1, allows 0 blanks at top, 1 at EOF
 sed '/^$/N;/\n$/D'        # method 2, allows 1 blank at top, 0 at EOF
 # delete all CONSECUTIVE blank lines from file except the first 2:
 sed '/^$/N;/\n$/N;//D'
 # delete all leading blank lines at top of file
 sed '/./,$!d'
 # delete all trailing blank lines at end of file
 sed -e :a -e '/^\n*$/{$d;N;ba' -e '}'  # works on all seds
 sed -e :a -e '/^\n*$/N;/\n$/ba'        # ditto, except for gsed 3.02.*
 # delete the last line of each paragraph
 sed -n '/^$/{p;h;};/./{x;/./p;}'
# SPECIAL APPLICATIONS:
 # remove nroff overstrikes (char, backspace) from man pages. The 'echo'
 # command may need an -e switch if you use Unix System V or bash shell.
 sed "s/.`echo \\\b`//g"    # double quotes required for Unix environment
 sed 's/.^H//g'             # in bash/tcsh, press Ctrl-V and then Ctrl-H
 sed 's/.\x08//g'           # hex expression for sed 1.5, GNU sed, ssed
 # get Usenet/e-mail message header
 sed '/^$/q'                # deletes everything after first blank line
 # get Usenet/e-mail message body
 sed '1,/^$/d'              # deletes everything up to first blank line
 # get Subject header, but remove initial "Subject: " portion
 sed '/^Subject: */!d; s///;q'
 # get return address header
 sed '/^Reply-To:/q; /^From:/h; /./d;g;q'
 # parse out the address proper. Pulls out the e-mail address by itself
 # from the 1-line return address header (see preceding script)
 sed 's/ *(.*)//; s/>.*//; s/.*[:<] *//'
 # add a leading angle bracket and space to each line (quote a message)
 sed 's/^/> /'
 # delete leading angle bracket & space from each line (unquote a message)
 sed 's/^> //'
 # remove most HTML tags (accommodates multiple-line tags)
 sed -e :a -e 's/<[^>]*>//g;/</N;//ba'
