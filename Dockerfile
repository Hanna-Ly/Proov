# Use the official PHP 7.4 image as the base image
FROM php:7.4

ENV TZ=Europe/Helsinki

# Install required packages
RUN apt-get update && \
    apt-get install -y \
        git \
        curl \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        zip \
        unzip \
        && docker-php-ext-install pdo_mysql mysqli mbstring exif pcntl bcmath gd

# Set the working directory
WORKDIR /var/www/html

# Copy the application files to the container
COPY ./html/ /var/www/html/

# Expose port 80
EXPOSE 80

# Start the PHP built-in web server
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]




