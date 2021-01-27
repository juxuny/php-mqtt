FROM crunchgeek/php-fpm:7.3
RUN apt-get update && apt-get install -y libmosquitto-dev vim
RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
  && docker-php-ext-configure gd \
     --with-freetype-dir=/usr/include/freetype2 \
     --with-png-dir=/usr/include \
     --with-jpeg-dir=/usr/include \
  && docker-php-ext-install gd
RUN pecl install Mosquitto-alpha && echo "extension=mosquitto.so" >> /usr/local/etc/php/conf.d/php-mosquitto.ini && echo "output_buffering=on" >> /usr/local/etc/php/conf.d/php-output.ini
