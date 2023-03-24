NAME=Inception

all:	re

stop:
		@ docker-compose -f srcs/docker-compose.yml down

clean:	stop
		@ rm -rf /home/alazzari/data
		@ docker volume rm $$(docker volume ls -qf) dangling=true

fclean:	clean
		@ docker system prune -a -f

re:	
		@ sh srcs/requirements/tools/configure.sh
		@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY:	all stop clean re
