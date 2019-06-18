#!bin/bash
cd /codeception

FILE=/codeception/codecept.phar
if [ ! -f "$FILE" ]; then
    wget https://codeception.com/codecept.phar
fi

php codecept.phar bootstrap
updatedb
chromedriver --url-base=/wd/hub
java -jar "/opt/selenium/selenium-server-standalone-3.4.0.jar"
exec "$@" #Keep the container alive