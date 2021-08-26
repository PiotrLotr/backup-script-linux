#!bin/bash

source=/var/log
dest=~/backups
date_today=$(date +%F)

echo "Proceeding $date_today backup..."

if [ ! -d $dest ] 
    then
        mdkir -p $dest
    fi    
    
find $source -name "*.gz" -exec tar -rvf /$dest/$date_today-backup.tar "{}" \;
echo "$date_today BACKLOG:" >> $dest/$date_today-raport.txt
find $source -name "*.gz" -printf "%P\n" >> $dest/$date_today-raport.txt

exit 0