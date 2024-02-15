setup:
	bin/setup
	bin/rails db:drop
    bin/rails db:migrate
    bin/rails db:seed
	yarn

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
