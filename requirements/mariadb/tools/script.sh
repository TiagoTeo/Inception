#!/bin/bash

if [ -d "/var/lib/mysql/$DB_NAME" ]
then 
	echo "Database already exists"
else
mysql_install_db

service mysql start
# Set root option so that connexion without root password is not possible

mysql_secure_installation <<_EOF_

Y
$DB_ROOT_PASSWORD
$DB_ROOT_PASSWORD
Y
n
Y
Y
_EOF_



#Create database and user for wordpress
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" | mysql -uroot -p$DB_ROOT_PASSWORD
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME; GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot -p$DB_ROOT_PASSWORD

fi
sleep 2

service mysql stop

exec mysqld_safe --bind-address=0.0.0.0



















# GUIDE FROM FORSTMAN1
# service mysql start 

# echo "CREATE DATABASE IF NOT EXISTS inception_db ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS 'db_user'@'%' IDENTIFIED BY 'pass' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON inception_db.* TO 'db_user'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql

# mysql < db1.sql

# # kill $(cat /var/run/mysqld/mysqld.pid)

# mysqld