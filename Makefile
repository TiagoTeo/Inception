WP_DIR = /home/mtiago-s/data/wordpress
MARIADB_DIR = /home/mtiago-s/data/mariadb

all: up

$(WP_DIR):
	@mkdir -p $@

$(MARIADB_DIR):
	@mkdir -p $@

up: $(MARIADB_DIR) $(WP_DIR)
	@docker compose -f srcs/docker-compose.yml up --build -d 

down: 
	@docker compose -f srcs/docker-compose.yml down

re: down up

deep_clean:
	@rm -rf $(MARIADB_DIR)
	@rm -rf $(WP_DIR)
	@docker system prune -a
	docker stop $(shell docker ps -qa)
	docker rm $(shell docker ps -qa)
	docker rmi -f $(shell docker images -qa)
	docker volume rm $(shell docker volume ls -q)
	docker network rm $(shell docker network ls -q)

.PHONY: all up down

#COLORS
GREEN = \033[1;32m
RED = \033[1;31m
DEFAULT = \033[0m
YELLOW = \033[1;33m