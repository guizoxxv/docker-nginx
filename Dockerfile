FROM nginx:stable

RUN apt update

# Required for zip; unzip; node; vim; curl;
RUN apt install -y zip unzip gnupg vim curl

# Install nodejs (comes with npm)
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt install -y nodejs

# Set apache folder permission
RUN chown -R www-data:www-data /usr/share/nginx

# Cleanup
RUN apt clean
RUN apt autoclean
