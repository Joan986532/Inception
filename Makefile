all : up

up :
	@mkdir -p /home/jnauroy/data
	@mkdir -p /home/jnauroy/data/mariadb
	@mkdir -p /home/jnauroy/data/wordpress
	@docker compose -f ./srcs/docker-compose.yml up -d

down :
	@docker compose -f ./srcs/docker-compose.yml down

status :
	@docker ps

images :
	@docker images

struct :
	@ls -alR

start :
	@docker compose -f ./srcs/docker-compose.yml start

stop :
	@docker compose -f ./srcs/docker-compose.yml stop

clean : down
	@docker compose -f ./srcs/docker-compose.yml down -v --rmi all --remove-orphans

fclean : clean
	docker system prune -af --volumes
	sudo rm -rf /home/jnauroy/data

re : fclean all

.PHONY : up down status struct start stop clean fclean re images all
