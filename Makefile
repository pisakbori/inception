LOGIN =		bpisak-l
ROOT_DIR= /home
DATA_PATH = ${ROOT_DIR}/${LOGIN}/data
ENV =		LOGIN=${LOGIN} DATA_PATH=${DATA_PATH} DOMAIN=${LOGIN}.42.fr

all : up

up : setup
	@docker compose -f ./srcs/docker-compose.yml up --build -d

down : 
	@docker compose -f ./srcs/docker-compose.yml down

stop : 
	@docker compose -f ./srcs/docker-compose.yml stop

start : 
	@docker compose -f ./srcs/docker-compose.yml start

status : 
	docker compose -f ./srcs/docker-compose.yml ps

setup:
	${ENV} ./add-host.sh
	mkdir -p ${DATA_PATH}
	mkdir -p ${DATA_PATH}/redis
	mkdir -p ${DATA_PATH}/db
	mkdir -p ${DATA_PATH}/wp

before-eval:
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa); docker rmi -f $$(docker images -qa); docker volume rm $$(docker volume ls -q); docker network rm $$(docker network ls -q) 2>/dev/null

check-tlsv1.2:
	openssl s_client -connect ${LOGIN}.42.fr:443 -tls1_2

check-tlsv1.3:
	openssl s_client -connect ${LOGIN}.42.fr:443 -tls1_3

try-connect-80:
	telnet bpisak-l.42.fr 80

try-connect-443:
	telnet bpisak-l.42.fr 443

clean: stop
	sudo rm -rf ${DATA_PATH}

fclean: clean
	docker compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	${ENV} ./remove-host.sh