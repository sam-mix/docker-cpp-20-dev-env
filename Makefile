.PHONY: build
build:
	@docker build -t cpp-20-dev-env:latest .

 
.PHONY: run
run:
	@docker run -d -p 22222:22 --name cpp-20-dev-env --restart=always cpp-20-dev-env:latest 


.PHONY: i
i:
	@docker run -it --rm -p 22222:22 cpp-20-dev-env:latest /bin/sh
