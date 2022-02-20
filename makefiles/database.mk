.PHONY: migrate
migrate: ##@database Apply migrations
	${DC} run --rm manage migrate --noinput

.PHONY: makemigrations
makemigrations: ##@database Creates new migrations based on changes made to the models
	${DC} run --rm manage makemigrations
