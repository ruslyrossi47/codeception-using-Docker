# Notes
1.  This image will install `Java`, `php7` `xvfb`, `chromedriver`, `selenium` and `codeception`.
2.  After container is created it will start running `chromedriver --url-base=/wd/hub` and `java -jar "/opt/selenium/selenium-server-standalone-3.4.0.jar"`, so you just need to focus on your test file.

# Steps
1. $your-terminal: `docker-compose build  && docker-compose up -d`
2. $your-terminal: `sudo docker exec -i -t codeception /bin/bash`
3. $docker-terminal: `php codecept.phar generate:cest acceptance First`
4. $docker-terminal: `php codecept.phar run acceptance`

# Help

### Stop existing container, build image and start the container
$your-terminal: `docker rm $(docker stop $(docker ps -a -q --filter ancestor=docker-unittest_php --format="{{.ID}}")) && docker-compose build  && docker-compose up -d`

### Access the container by name
$your-terminal: `sudo docker exec -i -t codeception /bin/bash`

### Build image without cache
$your-terminal: `docker-compose build --no-cache`
