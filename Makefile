NAME=Inception

all:	clean re

stop:
		@docker-compose -f ./srcs/docker-compose.yml down

clean:	stop
		@rm -rf /home/${USER}/data
		@docker container rm '$(docker container ps -aq)'

fclean:	clean
		@docker system prune -a

re:	
		@docker-compose up --build ./srcs/docker-compose.yml

.PHONY:	all stop clean re

