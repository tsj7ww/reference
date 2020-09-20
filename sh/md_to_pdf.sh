# Set up env
BASEDIR=$(dirname "$0")
# MD_DIR=${BASEDIR}/md
# cmd line input: MD_DIR=$1
# PDF_DIR=${BASEDIR}/pdf
# cmd line input: PDF_DIR=$2
TODAY=$(date +"%Y%m%d")
MD_DIR=$1
PDF_DIR=$1

rm_pdf() # rm old pdf files
{
	_PDF_DIR=$1;
	rm -r ${_PDF_DIR}/*;
}

gen_pdf() # generate new pdf files from md
{
	_MD_DIR=$1;
	_PDF_DIR=$2;
	# using for loop
	for _F_NAME in ${_MD_DIR}/*.md;
		do
		# _DIR=$(dirname "${F_NAME}")
		# _EXT="${FILE_EXT##*.}";
		# _FILE_NONEXT="${FILE_EXT%.*}";
		_FILE_EXT=$(basename -- "${_F_NAME}");
		_FILE=${_FILE_EXT//".md"/};
		pandoc "${_MD_DIR}/${_FILE}.md" -s -o "${_PDF_DIR}/${TODAY}-${_FILE}.pdf";
	done;
	# using find
	# find ./md/ -type f -name *.md -exec pandoc "%p" -s -o "%p.pdf";
}
# Rm old PDF files
main() # run functions
{
	#$(rm_pdf ${PDF_DIR});
	$(gen_pdf ${MD_DIR} ${PDF_DIR});
}

# run main
main
