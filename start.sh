#!/bin/bash

echo "Waiting for database..."
until php artisan db:show > /dev/null 2>&1; do
  echo "Retrying in 5 seconds..."
  sleep 5
done

echo "Dropping and recreating all tables..."
php artisan migrate:fresh --force

echo "Running seeder..."
php artisan db:seed --force

echo "Clearing caches..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "Starting server..."
php artisan serve --host=0.0.0.0 --port=10000