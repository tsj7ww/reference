BUILD_REQUIREMENTS()
{
    FPATH=$1
    CWD="$(dirname "$FPATH")"
    awk '{print $2}' $FPATH > $CWD/packages.tmp
    pip freeze -r $CWD/packages.tmp > $CWD/requirements.txt
    #rm $FPATH packages.tmp
}
BUILD_REQUIREMENTS $1
