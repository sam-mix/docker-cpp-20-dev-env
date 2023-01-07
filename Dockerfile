FROM alpine:latest
MAINTAINER SamMix <1045262335@qq.com>
USER root:root
WORKDIR /root
RUN sed -i 's#dl-cdn.alpinelinux.org#mirrors.cloud.tencent.com#g' /etc/apk/repositories && \
apk update && \
apk add --no-cache openssh-server gcc zsh vim g++ git screen && \
ssh-keygen -A && \
ssh-keygen -t ed25519 -C "1045262335@qq.com" -f ~/.ssh/id_ed25519 -q && \
sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 60/g' /etc/ssh/sshd_config && \
sed -i 's/#ClientAliveCountMax 3/ClientAliveCountMax 86400/g' /etc/ssh/sshd_config && \
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && \
echo "root:root" | chpasswd

EXPOSE 22
CMD ["/usr/sbin/sshd" , "-D"]
