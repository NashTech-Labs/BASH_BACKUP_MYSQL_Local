#!/bin/bash

# Set the variables
DB_USERNAME=username
DB_PASSWORD=password
DB_NAME=db_name
BACKUP_DIR=~/mysql_backups
S3_BUCKET=my-bucket

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Set the current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Create the backup file name
BACKUP_FILE=$BACKUP_DIR/$DB_NAME-$CURRENT_DATE.sql

# Dump the database and save the output to the backup file
mysqldump -u $DB_USERNAME -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Compress the backup file
gzip $BACKUP_FILE

# Copy the backup file to S3
aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/backups/
