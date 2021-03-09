FROM nginx:stable

RUN apt-get update

# Configure nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d

# Set apache folder permission
RUN chown -R www-data:www-data /usr/share/nginx

# Cleanup
RUN apt-get clean
RUN apt-get autoclean
