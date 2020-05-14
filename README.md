# Tadios Makufa Assesment
#### Introduction
This is a base docker-compose build with the pure Symfony 5 framework. It is
based on Nginx with PHP-FPM and connected to the PostgreSQL, also it has Adminer for the DB management.
This project has fe additional package monolog bundle for logging process and orm-pack for db connection verification.

#### Getting started
Start one of the next environment:
- make up-prod (For Production - working as daemon)
- make up-dev (Fod Development)
- make up-debug (For Debugging with enabled Xdebug extension)

#### Accessing
1. http://localhost/ - You should see default Symfony Welcome Page
2. http://localhost:8080/ - Adminer DataBase Management Panel
3. PostgreSQL:
- database:db
- user:db
- password:db

#### Notes
If xdebug is not working try to change remote_host ip address to your local ip address
.docker/php/xdebug.ini
