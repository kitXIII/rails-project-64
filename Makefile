setup: install db-prepare

install:
	bin/setup
	yarn

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load

start:
	bin/dev

console:
	bin/rails console

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop app -A

test:
	yarn run build
	yarn run build:css
	NODE_ENV=test bin/rails test

.PHONY: test
