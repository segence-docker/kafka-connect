ORGANIZATION := segence
REPOSITORY := $(shell basename -s .git `git config --get remote.origin.url`)
VERSION := $(shell git describe --tags --match 'v*' --abbrev=0 | cut -c2-)

FONT_ESC := $(shell printf '\033')
FONT_BOLD := ${FONT_ESC}[1m
FONT_NC := ${FONT_ESC}[0m # No colour

all:
	@echo "Use a specific goal. To list all goals, type 'make help'"

.PHONY: build # Builds Docker image
build:
ifndef profile
	$(error profile parameter is undefined)
endif
	@docker buildx build --platform linux/amd64,linux/arm64 --load --tag $(ORGANIZATION)/$(REPOSITORY):$(VERSION)-$(profile) ./$(profile)

.PHONY: push # Pushes Docker image
push:
ifndef profile
	$(error profile parameter is undefined)
endif
	@docker push $(ORGANIZATION)/$(REPOSITORY):$(VERSION)-$(profile)

.PHONY: release # Releases new tag; arguments: 'version=[semver version number]': define the version to release
release:
ifndef version
	$(error version parameter is undefined)
endif
	@git tag $(version)
	@git push --tags

.PHONY: help # Generate list of goals with descriptions
help:
	@echo "Available goals:\n"
	@grep '^.PHONY: .* #' Makefile | sed "s/\.PHONY: \(.*\) # \(.*\)/${FONT_BOLD}\1:${FONT_NC}\2~~/" | sed $$'s/~~/\\\n/g' | sed $$'s/~/\\\n\\\t/g'
