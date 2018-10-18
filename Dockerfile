FROM nginx:stable

ENV NGINX_ROOT ${NGINX_ROOT:-/usr/share/nginx/html}

RUN apt update

# Required for zip; unzip; node; vim; curl;
RUN apt install -y zip unzip gnupg vim curl

# Install nodejs (comes with npm)
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt update && apt-get install -y nodejs

# Copy custom nginx configuration into container
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Set NGINX root - Replace NGINX_ROOT on config file with NGINX_ROOT environment variable
RUN sed -ri -e 's!NGINX_ROOT!'"${NGINX_ROOT}"'!g' /etc/nginx/conf.d/default.conf

# Set apache folder permission
RUN chown -R www-data:www-data ${NGINX_ROOT}

# Cleanup
RUN apt clean
RUN apt autoclean
