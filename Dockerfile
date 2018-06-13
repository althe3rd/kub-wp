FROM wordpress:latest
# highly recommend you always pin versions for anything beyond dev/learn

#WORKDIR /var/www/html

#VOLUME ["/wp-data"]

#Copy WP Contents to workdir
#COPY ./wp-content ./wp-content

# Add sudo in order to run wp-cli as the www-data user
RUN apt-get update && apt-get install -y sudo vim

# Add WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp

# Redirect http to https
COPY [".htaccess", "/usr/src/wordpress"]


# Setup SMTP running config.sh
COPY ["apache2-config.sh", "/usr/local/bin/"]
RUN sudo [ "/usr/local/bin/apache2-config.sh" ]