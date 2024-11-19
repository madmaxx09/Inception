name = Inception
all:
	@printf "Making ${name}...\n"
	mkdir -p /home/$(USER)/data/wordpress
	mkdir -p /home/$(USER)/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

re:	down
	@printf "RE ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@printf "Shutting down ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down
	

fclean: clean
	@printf "DeepCleaning docker\n"
	@docker system prune -a
	sudo rm -rf /home/$(USER)/data/
.PHONY	: all build down re clean fclean