help:
	@echo "Usage:\n\tmake target1 target2 ... target3\n"
	@echo "Targets:"
	@echo "\tbuild\tBuild docker image"
	@echo "\tup\tRun services"
	@echo "\tdown\tStop services"
	@echo "\tlogs\tShow logs"
	@echo "\tinstall\tInstall dependencies"
	@echo "\tshell\tRun app shell"
	@echo "\tupdate\tInstall project dependencies from composer.json"
	@echo "\tlint\tRun lint"
	@echo "\ttest\tRun test"

build:
	$(call dc,build)

up:
	$(call dc,up -d)

down:
	$(call dc,kill)
	$(call dc,rm -f)

logs:
	$(call dc,logs -f)

install:
	$(call dcr,composer install)

shell:
	$(call dcr,sh)

update:
	$(call run-app,composer update)

lint:
	$(call run-app,composer run phpcs && composer run phpmd)

test:
	$(call run-app,php artisan test)

define dc
	docker-compose $1
endef

define dcr
	$(call dc,run --rm app $1)
endef

define run-app
	$(call dcr, sh -c "cd app && $1")
endef
