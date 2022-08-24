.PHONY: docker fmt install lint test

docker:
	docker build -t aws-lambda-zipper src

fmt:
	yarn --cwd=src format:write

install:
	yarn --cwd=src install
	
lint:
	yarn --cwd=src lint

test:
	yarn --cwd=src test
