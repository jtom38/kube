.PHONY: help
help: ## Shows this help command
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

test: ## Runs unit tests
	#rm ./mounts/database/newsbot.db
	alembic upgrade head
	pytest
	rm ./mounts/database/newsbot.db

refresh: ## Removes temp data for a clean start
	rm ./mounts/database/newsbot.db

new-app: ## Generates default folder structure for a new application
  @echo "What is your age?: "; \
    read AGE; \
    echo "Your age is ", $$(AGE)

