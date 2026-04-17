FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip zip nodejs npm \
    libzip-dev libpng-dev libjpeg-dev libfreetype6-dev libpq-dev

# PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql zip gd

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# 🔥 IMPORTANT: install Node + build Vite
RUN npm install
RUN npm run build

# Permissions
RUN chmod +x /start.sh

EXPOSE 10000

CMD ["/start.sh"]
