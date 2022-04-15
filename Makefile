.DEFAULT_GOAL := build

EXECUTABLE=dns-inventory
VERSION=$(shell git describe --tags --always)


build-linux:
	env GOOS=linux GOARCH=amd64 go build -ldflags "-s -w -X 'github.com/NeonSludge/ansible-dns-inventory/internal/build.Version=$(VERSION)' -X 'github.com/NeonSludge/ansible-dns-inventory/internal/build.Time=$(shell date -u +%Y%m%dT%H%M%SZ)'" -o ./$(EXECUTABLE)_$(VERSION)_amd64_linux ./cmd/$(EXECUTABLE)
	env GOOS=linux GOARCH=arm64 go build -ldflags "-s -w -X 'github.com/NeonSludge/ansible-dns-inventory/internal/build.Version=$(VERSION)' -X 'github.com/NeonSludge/ansible-dns-inventory/internal/build.Time=$(shell date -u +%Y%m%dT%H%M%SZ)'" -o ./$(EXECUTABLE)_$(VERSION)_arm64_linux ./cmd/$(EXECUTABLE)

build: build-linux build-darwin build-windows