NAME=Inception

all:	re

stop:
		@ docker-compose -f srcs/docker-compose.yml stop

clean:	stop
		@ docker-compose -f srcs/docker-compose.yml down --volume --rmi all
		

fclean:	clean
		@ docker system prune -a -f

re:
		@ sh srcs/requirements/tools/configure.sh
		@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY:	all stop clean fclean re
