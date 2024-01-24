MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_USER=root
MYSQL_PASSWORD_FILE=/run/secrets/team1-db-password

mysqladmin ping -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER --password=$(cat $MYSQL_PASSWORD_FILE) > /dev/null 2>&1

if [ $? -eq 0 ]; then
    exit 0  
else
    exit 1  
fi