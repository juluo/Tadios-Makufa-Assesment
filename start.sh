#! /bin/bash
readonly ENV_DEV="dev"
readonly ENV_PROD="prod"
readonly ENV=$1

install_composer() {
  echo "Installing composer packages"
  if [ "$ENV" = "$ENV_PROD" ]; then
    composer install --optimize-autoloader --no-scripts --no-plugins --prefer-dist --no-progress --no-interaction
  else
    composer install --optimize-autoloader
  fi
  echo "Composer packages were installed successfully"
}

copy_env_file() {
  FILE=.env
  if [ -f "$FILE" ]; then
    echo "$FILE file is exist and will not be replaced!"
  else
    echo "$FILE does not exist"
    echo "Copying $FILE..."
    if [ "$ENV" = "$ENV_PROD" ]; then
      cp environments/env.prod .env
    else
      cp environments/env.dev .env
    fi
    echo "$FILE copied"
  fi
}

run() {
  if [ "$ENV" = "$ENV_DEV" ] || [ "$ENV" = "$ENV_PROD" ]; then
    copy_env_file
    install_composer
    php bin/console cache:warmup
    php-fpm
  else
    echo 'Wrong environment`s argument provided'
  fi
}
run
