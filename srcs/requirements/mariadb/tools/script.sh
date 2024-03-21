echo "Creating Maria Db"

# Checks if the Data base with the given name already exists, if so it prints out a message and skips the else step
if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists"
else
service mariadb start

echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -uroot
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
fi

sleep 2

# We stop the service and in the next line we execute it again, this is to make sure all our configurations are set in place
service mariadb stop

# This starts the MariaDB server and binds it to the local address
exec mysqld_safe --bind-address=0.0.0.0