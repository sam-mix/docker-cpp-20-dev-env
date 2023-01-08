.PHONY: all
all: build

# 构建镜像
.PHONY: build
build:
	@docker build -t cpp-20-dev-env:latest .

# 构建centos版本镜像
.PHONY: bc
bc:
	@docker build  -f ./Dockerfile-centos -t cpp-20-dev-env:latest .

# 构建gcc版本镜像
.PHONY: bg
bg:
	@docker build  -f ./Dockerfile-gcc -t cpp-20-dev-env:latest .

# 正常运行
.PHONY: run
run:
	@docker run -d -p 22222:22 --name cpp-20-dev-env --hostname cpp20 --restart=always cpp-20-dev-env:latest 

# 正常运行
.PHONY: rg
rg:
	@docker run -d -p 22022:22 --name cpp-20-dev-env-gcc --hostname cpp20 --restart=always sammix888/cpp-20-dev-env:gcc 

# 交互运行
.PHONY: i
i:
	@docker run -it --rm -p 22222:22 cpp-20-dev-env:latest /bin/sh
