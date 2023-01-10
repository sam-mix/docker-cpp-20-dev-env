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

# 构建gcc版本镜像
.PHONY: bcl
bcl:
	@docker build  -f ./Dockerfile-clang -t sammix888/cpp-20-dev-env:clang .

# 正常运行
.PHONY: run
run:
	@docker run -d -p 22222:22 --name cpp-20-dev-env --hostname cpp20 --restart=always cpp-20-dev-env:latest 

# 正常运行
.PHONY: rg
rg:
	@docker run -d -p 22022:22 --name cpp-23-dev-env --hostname cpp23 --restart=always sammix888/cpp-20-dev-env:gcc 

# 正常运行
.PHONY: rcl
rcl:
	@docker run -d -p 22122:22 --name clang15 --hostname clang15 --restart=always sammix888/cpp-20-dev-env:clang

# 交互运行
.PHONY: i
i:
	@docker run -it --rm -p 22222:22 cpp-20-dev-env:latest /bin/sh
