FROM alpine:latest
MAINTAINER SamMix <1045262335@qq.com>
USER root:root
WORKDIR /root
RUN sed -i 's#dl-cdn.alpinelinux.org#mirrors.cloud.tencent.com#g' /etc/apk/repositories && \
apk update && \
apk add --no-cache openssh-server gcc zsh vim g++ git screen && \
zsh && \
ssh-keygen -A && \
ssh-keygen -t ed25519 -C "1045262335@qq.com" -f ~/.ssh/id_ed25519 -q && \
sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 60/g' /etc/ssh/sshd_config && \
sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 86400/g' /etc/ssh/sshd_config && \
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
echo "root:root" | chpasswd && \
git config --global user.email "1045262335@qq.com" && \
git config --global user.name "Sam Mix" && \
git clone https://gitee.com/mihongkun/ohmyzsh.git ~/.oh-my-zsh && \
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc && \
git clone --depth=1 https://gitee.com/mihongkun/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k && \
git clone https://gitee.com/mihongkun/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions && \
git clone https://gitee.com/mihongkun/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting 

EXPOSE 22
CMD ["/usr/sbin/sshd" , "-D"]
