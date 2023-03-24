NAME=Inception

all:	re

stop:
		@ docker-compose -f srcs/docker-compose.yml down

clean:	stop
		@ rm -rf /home/alazzari/data

fclean:	clean
		@ docker system prune -a -f --volumes

re:	
		@ 
		@ docker-compose -f srcs/docker-compose.yml up --build

.PHONY:	all stop clean re
