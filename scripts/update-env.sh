#!/bin/bash

# Check if the parameter is provided
if [ -z "$1" ]; then
    echo "Please provide 'local' or 'remote' as a parameter."
    exit 1
fi

# Set the file path based on the parameter
if [ "$1" = "local" ]; then
    ENV_FILE=".env.local-db"
elif [ "$1" = "remote" ]; then
    ENV_FILE=".env.local-db-remote"
else
    echo "Invalid parameter. Please provide 'local' or 'remote'."
    exit 1
fi

# Read the values from the specified file
DB_URL=$(grep -E '^TURSO_DB_URL=' "$ENV_FILE" | cut -d '=' -f2)
AUTH_TOKEN=$(grep -E '^TURSO_DB_AUTH_TOKEN=' "$ENV_FILE" | cut -d '=' -f2)

# Replace the values in .env.local
sed -i "" "s|^TURSO_DB_URL=.*|TURSO_DB_URL=${DB_URL}|" .env.local
sed -i "" "s|^TURSO_DB_AUTH_TOKEN=.*|TURSO_DB_AUTH_TOKEN=${AUTH_TOKEN}|" .env.local