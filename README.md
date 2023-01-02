# BASH_BACKUP_MYSQL_Local
This script will create a MySQL dump of the database specified in the DB_NAME variable and save it to a file with the name db_name-YYYY-MM-DD.sql.gz in the ~/mysql_backups directory. The backup file will be compressed using gzip. then send it to the backups directory in the S3 bucket specified in the S3_BUCKET variable.

If You want you can store the compressed backup file on s3
Before Running this script please make sure to add all the variables and configure your aws account.
