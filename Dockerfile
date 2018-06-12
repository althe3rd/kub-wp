FROM wordpress:latest
# highly recommend you always pin versions for anything beyond dev/learn

WORKDIR /var/www/html

#Copy WP Contents to workdir
COPY ./wp-content ./wp-content