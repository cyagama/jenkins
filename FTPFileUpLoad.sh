SERVER=$1
USER=$2
PASSWORD=$3
CURRENT_PATH=$4

cd $CURRENT_PATH
HTML_FILES=`find . -type f -name "*.html"`

for file in $HTML_FILES; do
    nkf -s --overwrite $file
    ftp -n <<END

    open $SERVER
    user $USER $PASSWORD

    prompt off
    type ascii
    verbose on
    status

    put $file
    quit
END
done
