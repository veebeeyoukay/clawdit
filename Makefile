.PHONY: build test lint clean release

BINARY=clawdit
VERSION?=0.1.0-alpha
COMMIT=$(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")
BUILD_DATE=$(shell date -u +%Y-%m-%dT%H:%M:%SZ)
LDFLAGS=-ldflags "-X main.version=$(VERSION) -X main.commit=$(COMMIT) -X main.buildDate=$(BUILD_DATE)"

build:
	go build $(LDFLAGS) -o bin/$(BINARY) ./cmd/clawdit/

test:
	go test ./... -v -race -count=1

lint:
	golangci-lint run ./...

clean:
	rm -rf bin/

release:
	goreleaser release --clean

install: build
	cp bin/$(BINARY) $(GOPATH)/bin/

.DEFAULT_GOAL := build
