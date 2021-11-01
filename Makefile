server:
	cd docker && @docker stop docker-nodejs-1
	cd docker && @docker-compose up --build -d

start:
	@cd docker && docker-compose up -d

down:
	@cd docker && docker-compose down

build:
	@make down && cd docker && docker-compose up --build -d

init:
	git clone https://github.com/bxlt1k/users_api.git ./services/users_api
	git clone https://github.com/bxlt1k/frontend.git ./services/frontend
	git clone https://github.com/bxlt1k/chat_api.git ./services/chat_api
	cd services/users_api/ && composer install
	cd services/frontend/ && composer install
	cd services/chat_api && npm install

composer:
	@cd services/users_api/composer && composer install

status:
	@cd docker && docker-compose ps

migrate:
	@migrate -path=docker/migrations -database "mysql://root:root@tcp(chat.loc:8989)/test" up