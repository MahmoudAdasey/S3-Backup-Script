#!/bin/bash

Time=$( date +%m-%d-%y_%H_%H_%S )
Backup_file=/home/ubuntu/bash
Dest=/home/ubuntu/backup
Filename=file-backup-$Time.tar.gz
LOG_FILE="/home/ubuntu/backup/logfile.log"

S3_BUCKET="s3-bash-mahmoud-adasey"
FILE_TO_UPLOUD="$Dest/$Filename"


if ! command -v aws &> /dev/null
then
        echo "AWS CLI IS NOT INSTALLED, please install it first. "
        exit 2
fi


if [ $? -ne 2 ]
then
 if [ -f $Filename ]
 then
        echo " Error file $Filename already exists! "| tee -a "$LOG_FILE"
 else
        tar -czvf "$Dest/$Filename" "$Backup_file"
        echo
        echo "Backup Completed successfuly. Backup file: $Dest/$Filename " | tee -a "$LOG_FILE"
        echo
        aws s3 cp "$FILE_TO_UPLOUD" "s3://$S3_BUCKET/"
 fi
fi


if [ $? -eq 0 ]
then
        echo
        echo "File Uploaded successfuly to the S3 bucket: $S3_BUCKET"
else
        echo "File Upload to S3 failed"
fi

