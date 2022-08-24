.PHONY: docker fmt install lint test tfapply tfplan

docker:
	docker build -t aws-lambda-zipper src

fmt:
	yarn --cwd=src format:write

install:
	yarn --cwd=src install
	
lint:
	yarn --cwd=src lint
