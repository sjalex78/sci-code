.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: build
build:
	bundle exec rubocop
	bundle exec rspec

.PHONY: db-reseed
db-reseed:
	bin/rails restart && bin/rails db:drop db:create db:migrate db:seed

.PHONY: rubocop
rubocop:
	bundle exec rubocop

.PHONY: rubocop-fix
rubocop-fix:
	bundle exec rubocop -A

.PHONY: build
build: rubocop
	bundle exec rspec

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "${YELLOW}make db-reseed${NC}   DROP and recreate and reseed development db"
	@echo "${YELLOW}make rubocop${NC}     run rubocop"
	@echo "${YELLOW}make rubocop-fix${NC} fix rubocop"
	@echo
	@echo "${YELLOW}make build${NC}       run full build"
	@echo
