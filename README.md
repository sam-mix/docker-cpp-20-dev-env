# docker-cpp-20-dev-env
GCC development environment suport c++ 20 with docker.


## generate ssh key 

```bash
ssh-keygen -t ed25519 -C "1045262335@qq.com"
```

## centos stream 8 setup

```bash
# /bin/sh: warning: setlocale: LC_ALL: cannot change locale (zh_CN.UTF-8)
yum install -y langpacks-zh_CN && \
yum -y reinstall glibc-common && \
```