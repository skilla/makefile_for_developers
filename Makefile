.DEFAULT_GOAL := help
SHELL := /bin/zsh

.ONESHELL:
.PHONY: help
help:
	@[ -f ${MAKEFILE_EXTRAS_FILE} ] && . ${MAKEFILE_EXTRAS_FILE} || function make_help() { echo "$$1  -> $$2"; shift; shift; for i in "$$@"; do echo "    $$i"; done }
	make_help "help"      "Show this help"
	make_help "deps"      "Install all project dependencies. Run this target after any branch changes or when updating the current branch from the server, it might be a good option to run it in a git hook"
	make_help "deps-php"  "Install all the project's PHP dependencies"
	make_help "deps-js"   "Install all the project's JS dependencies"
	make_help "build"     ""
	make_help "build-php" ""
	make_help "build-js"  ""
	make_help "start"     ""
	make_help "stop"      ""

.ONESHELL:
.PHONY: deps
deps: deps-php deps-js
	@echo "Install all dependencies"

.ONESHELL:
.PHONY: deps-php
deps-php:
	@echo "Install php dependencies"
	# composer install

.ONESHELL:
.PHONY: deps-js
deps-js:
	@echo "Install Javascript dependencies"
	# yarn install

.ONESHELL:
.PHONY: build
build: build-php build-js
	@echo "Build"

.ONESHELL:
.PHONY: build-php
build-php:
	@echo "Build PHP"

.ONESHELL:
.PHONY: build-js
build-js:
	@echo "Build JS"

.ONESHELL:
.PHONY: start
start:
	@echo "Start de application"

.ONESHELL:
.PHONY: stop
stop:
	@echo "Stop de application"

