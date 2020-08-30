.DEFAULT_GOAL := help
SHELL := /bin/zsh

.ONESHELL:
.PHONY: help
help:
	@. ${MAKEFILE_EXTRAS_FILE}
	make_help "help"     "Show this help"
	make_help "deps"     "Install all project dependencies. Run this target after any branch changes or when updating the current branch from the server, it might be a good option to run it in a git hook"
	make_help "deps-php" "Install all the project's PHP dependencies"
	make_help "deps-js"  "Install all the project's JS dependencies"
	make_help "build"    ""

deps: deps-php deps-js
	@echo "deps"

deps-php:
	@echo "deps-php"

deps-js:
	@echo "deps-js"

build: build-js build-php
	@echo "Build"

build-js:
	@echo "Build JS"

build-php:
	@echo "Build PHP"
