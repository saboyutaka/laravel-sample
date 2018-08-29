.DEFAULT_GOAL := help

build: ## build develoment environment with laradock
	if ! [ -f .env ];then cp .env.example .env;fi
	docker-compose build
	docker-compose run --rm php composer install
	docker-compose run --rm php php artisan key:generate
	docker-compose run --rm php php artisan migrate
	docker-compose run --rm php php artisan db:seed
	docker-compose run --rm yarn install
	docker-compose run --rm yarn run dev

serve: ## Run Server
	docker-compose up php

tinker: ## Run tinker
	docker-compose run --rm php php artisan tinker

composer: ## Entry for Composer command
	docker-compose run --rm php composer install

yarn-dev: ## Entry for yarn command
	docker-compose run --rm yarn run dev

yarn-watch: ## Run yarn watch
	docker-compose run --rm yarn run watch

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
