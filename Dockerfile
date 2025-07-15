# Use official PHP Apache image
FROM php:8.2-apache

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo_mysql mysqli mbstring exif pcntl bcmath gd

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy project files (including composer.json)
COPY . .

# Install PHP dependencies (optimize for production)
RUN composer install --no-dev --optimize-autoloader || echo "Composer install failed. Check composer.json."

# Set permissions (resilient to missing storage dir)
RUN chown -R www-data:www-data /var/www/html \
    && [ -d /var/www/html/storage ] && chmod -R 755 /var/www/html/storage || echo "No storage directory, skipping chmod"

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
