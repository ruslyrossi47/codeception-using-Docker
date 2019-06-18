FROM ubuntu

RUN apt-get -y update
RUN apt-get -y install curl nano wget
RUN apt-get install -y software-properties-common
RUN apt-get install -y mlocate

RUN add-apt-repository ppa:ondrej/php
RUN apt-get install -y php7.0-common php7.0-zip zip php7.0-fpm php7.0-zip php7.0-cli php7.0-json php7.0-mysql php7.0-curl php7.0-intl php7.0-mcrypt php-pear php7.0-gd php7.0-zip php7.0-xml php7.0-mbstring

# Install Java
RUN apt-get install -y default-jdk

# We need wget to set up the PPA and xvfb to have a virtual screen and unzip to install the Chromedriver
RUN apt-get install -y wget xvfb unzip

# Set up the Chrome PPA
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Update the package list and install chrome
RUN apt-get update -y
RUN apt-get install -y google-chrome-stable

# Set up Chromedriver Environment variables
ENV CHROMEDRIVER_VERSION 75.0.3770.90
ENV CHROMEDRIVER_DIR /chromedriver
RUN mkdir $CHROMEDRIVER_DIR

# Download and install Chromedriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# Put Chromedriver into the PATH
ENV PATH $CHROMEDRIVER_DIR:$PATH

# Install Selenium
RUN mkdir -p /opt/selenium
RUN wget --no-verbose -O /opt/selenium/selenium-server-standalone-3.4.0.jar http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar
RUN chmod +x /opt/selenium/selenium-server-standalone-3.4.0.jar

# Install composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- \
        --filename=composer \
        --install-dir=/usr/local/bin
RUN composer global require --optimize-autoloader \
        "hirak/prestissimo"
RUN php -v

# ADD start.sh
COPY start.sh /usr/local/bin
ENTRYPOINT ["/bin/bash"]
CMD ["/usr/local/bin/start.sh"]
