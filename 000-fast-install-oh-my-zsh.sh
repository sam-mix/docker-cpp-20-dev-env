#!/usr/bin/env bash

if [ ! -d ~/.oh-my-zsh ]
then
cp .p10k.zsh ~
cp .zshrc ~
git clone https://gitee.com/mihongkun/ohmyzsh.git ~/.oh-my-zsh
git clone --depth=1 https://gitee.com/mihongkun/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
git clone https://gitee.com/mihongkun/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://gitee.com/mihongkun/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
sed -i 's#root:x:0:0::/root:/bin/bash#root:x:0:0::/root:/bin/zsh#g' /etc/passwd
fi