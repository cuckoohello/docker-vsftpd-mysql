#%PAM-1.0
auth     required  pam_mysql.so user=${MYSQL_USER} passwd=${MYSQL_PASSWORD} host=${MYSQL_HOST} db=${MYSQL_DATABASE} table=${MYSQL_TABLE} usercolumn=${MYSQL_USER_COLUMN} passwdcolumn=${MYSQL_PASSWD_COLUMN} crypt=${MYSQL_PASSWD_CRYPT}
account  required  pam_permit.so
