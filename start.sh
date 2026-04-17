#!/bin/bash

echo "Running migrations..."
php artisan migrate --force

echo "Clearing caches..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "Starting server..."
php artisan serve --host=0.0.0.0 --port=10000

