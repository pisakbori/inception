LOGIN =		bpisak-l
DOMAIN =	${LOGIN}.42.fr
DATA_PATH = ${HOME}/${LOGIN}/data

all : up

up : setup
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	docker-compose -f ./srcs/docker-compose.yml ps

setup:
	mkdir -p ~/${LOGIN}/
	mkdir -p ${DATA_PATH}
	mkdir -p ${DATA_PATH}/db
	mkdir -p ${DATA_PATH}/wp

clean: stop
	@rm -rf ${DATA_PATH}

fclean: clean
	docker-compose -f ./srcs/docker-compose.yml down --volumes --rmi all