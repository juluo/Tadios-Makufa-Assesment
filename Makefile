default: up-dev

up-prod:
	 @docker-compose down && \
         docker-compose build --parallel --no-cache && \
         docker-compose \
             -f docker-compose.yaml \
             -f docker-compose.php-base.yaml \
             -f docker-compose.prod.yaml \
         up -d --remove-orphans\

up-dev:
	 @docker-compose down && \
         docker-compose build --parallel && \
         docker-compose \
             -f docker-compose.yaml \
             -f docker-compose.php-base.yaml \
             -f docker-compose.dev.yaml \
         up\

up-debug:
	 @docker-compose down && \
         docker-compose build --parallel && \
         docker-compose \
             -f docker-compose.yaml \
             -f docker-compose.php-debug.yaml \
         up\

down:
	@docker-compose down