# Inception

Launching an app for the sake of learning docker.
Rules were simple :
- 3 containers launched with a single docker-compose.yml file
- These containers are connected to each other with docker-network
- Nginx listening on port 443 (only port of the network oppened for outside acces)
- Wordpress with php and fastcgi process manager
- Mariadb connected to the wordpress website
- Volume 1 : mariadb
- Volume 2 : Wordpress files
