# docker-cpp-20-dev-env
GCC development environment suport c++ 20 with docker.


## fast install oh-my-zsh
``` bash
cp .p10k.zsh ~
cp .zshrc ~
git clone https://gitee.com/mihongkun/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://gitee.com/mihongkun/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
git clone https://gitee.com/mihongkun/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://gitee.com/mihongkun/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
```


## docker install 
``` bash
wget -O /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
sed -i 's+download.docker.com+mirrors.cloud.tencent.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo
yum install docker-ce
cat > /etc/docker/daemon.json <<EOF 
{
    "registry-mirrors": [
        "https://mirror.ccs.tencentyun.com",
        "https://hub-mirror.c.163.com",
        "https://mirror.baidubce.com"
    ]
}
EOF

```

## generate ssh key 

```bash
ssh-keygen -t ed25519 -C "1045262335@qq.com"
```

## centos stream 8 setup

```bash
# /bin/sh: warning: setlocale: LC_ALL: cannot change locale (zh_CN.UTF-8)
yum install -y langpacks-zh_CN && \
yum -y reinstall glibc-common
```

## docker help
```bash
# 清理容器 clean container
docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker ps -a 
# 清理镜像 clean images
docker image rm -f $(docker images -aq) && clear && docker images -aq 
```

## next operate
```bash
# 安装
git clone https://gitee.com/mihongkun/ohmyzsh.git ~/.oh-my-zsh

# 备份与替换zsh配置文件
# mv ~/.zshrc  ~/.zshrc.bak
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# 安装p10k主题
git clone --depth=1 https://gitee.com/mihongkun/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
# 安装自动建议插件
git clone https://gitee.com/mihongkun/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
# 安装高亮插件
git clone https://gitee.com/mihongkun/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

sed -i 's#robbyrussell#powerlevel10k/powerlevel10k#g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(\n\tgit\n\tzsh-autosuggestions\n\tzsh-syntax-highlighting\n)/g' ~/.zshrc

# sed -i 's/原字符串/替换字符串/g' filename

cat >> ~/.zshrc <<EOF 
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
EOF

# 安装完成后配置 p10k ，根据提示进行配置即可
source ~/.zshrc # 第一次系统会自动进行配置
# 重复配置 p10k
p10k configure

```



## arch linux 
```bash
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
echo 'Server = https://mirrors.cloud.tencent.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
pacman -Syy
```

## ubuntu linux


## debian linux
```bash
cp /etc/apt/sources.list /etc/apt/sources.list.bak
sed -i 's/deb.debian.org/mirrors.tencentyun.com/g' /etc/apt/sources.list
apt update -y && apt upgrade -y
```
