# EXECUTABLES
MYSQLDUMP_CMD = '/usr/bin/mysqldump'
MONGODUMP_CMD = '/usr/bin/mongodump'
GZIP_CMD = '/bin/gzip'
TAR_CMD = '/bin/tar'
CP_CMD = '/bin/cp'

# COMPRESSION
#  * Defines the compression factor of gzip. Must be a digit from 1-9. Lower numbers provide
#    less compression but are faster, and vice versa. The default compression level is 6
#    (that is, biased towards high compression at expense of speed).
GZIP_STRENGTH = 6

# PATHS
TMP_BACKUP_PATH = '/tmp' # Will be created as parent for a temp directory before uploading.

# use SSL to transmit backups to S3 (a good idea)
USE_SSL = true

# LIMIT PRIVILEGES
#  * Limits actions to only write new backups and create new buckets. No attempts are made to
#    delete data from S3. Set this to true when the credentials you provide don't have the
#    rights to perform deletions. This is a handy way to prevent disaster should someone
#    malicious gain access to them. With correctly restricted IAM permissions they won't be
#    able to delete existing backups. Use a separate server and credentials to purge old backups.
#    (default is false)
SKIP_DELETE = false

# CREATE AWS/S3 CONNECTION
AWS::S3::Base.establish_connection!(
  :access_key_id  => '*** YOUR CREDENTIALS HERE ***',
  :secret_access_key => '*** YOUR CREDENTIALS HERE ***',
  :use_ssl => USE_SSL
)

# SPECIFY S3 BUCKET
#  * Note: Must be globally unique. Will automatically be created if it does not exist.
S3_BUCKET = 'my.unique.name'

# SPECIFY HOW MANY DAYS OF ARCHIVES YOU WANT TO KEEP
#  * Warning: The expiration is performed on *all* objects in the bucket.
#             If you use this script on multiple servers, use separate buckets for each.
DAYS_OF_ARCHIVES = 30

# MYSQL CONFIG
#  * Put the MySQL table names that you want to back up in the MYSQL_DBS array below
#    Archive will be named in the format: db-table_name-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
# MYSQL_DBS = ['application_production', 'wordpress', 'something_else']
# For backup all databases comment the MYSQL_DBS and comment out the MYSQL_ALL
MYSQL_ALL = true
MYSQL_DB = 'localhost'
MYSQL_USER = 'XXXXX'
MYSQL_PASS = 'XXXXX'

# MONGODB CONFIG
#  * Put the MongoDB table names that you want to back up in the MONGO_DBS array below
#    Archive will be named in the format: mdb-table_name-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
# MONGO_DBS = ['mongo_db_one', 'mongo_db_test']
# MONGO_HOST = 'localhost'

# DIRECTORY BACKUP CONFIG
#  * Add hash pair for each directory you want to backup
#    in format: "name_for_backup" => "/actual/directory/name"
#    Archive will be named in the format: dir-name_for_backup-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
# DIRECTORIES = {
#   "userhome" => "/home/user",
#   "apacheconfig" => "/etc/httpd"
# }
# You can set excludes in this array.
# DIRECTORIES_EXCLUDE = ['*.old', '*zopectl']

# SINGLE FILES CONFIG
#  * Add hash pair for each grouping of single files you want to backup
#    in format: "name_for_backup" => [array of single files to backup]
#    Archive will be named in the format: files-name_for_backup-200912010423.tgz
#    where 200912010423 is the date/time when the script is run
# SINGLE_FILES = {
#   'important_configs' => ['/etc/hosts', '/etc/my.cnf'],
#   'other_configs' => ['/etc/syslog.conf', '/etc/smb.conf']
# }
