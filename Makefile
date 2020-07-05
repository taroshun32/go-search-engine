ifdef update
  u=-u
endif

export GO111MODULE=on

.PHONY: deps
deps:
	go get ${u} -d
	go mod tidy

.PHONY: devel-deps
devel-deps:
	GO111MODULE=off go get ${u} \
	  golang.org/x/lint/golint

.PHONY: test
test: deps
	docker-compose up -d
	go test -v -cover

.PHONY: install
install: deps
	go install ./cmd/tinysearch
