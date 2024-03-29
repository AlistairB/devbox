#!/bin/bash
set -Eexu

# wget -qO- https://raw.githubusercontent.com/AlistairB/devbox/master/run.sh | sh

ssh-keygen -t ed25519 -f ~/.ssh/github_public -C 'alistair@email.com'

cat ~/.ssh/github_public.pub

read -p "Add ssh key to github public and press enter"

mkdir -p ~/util

cd ~/util

sudo apt update && sudo apt install -y git

git clone git@github.com:AlistairB/devbox.git

sudo apt remove -y git

echo 'export PATH=$PATH:$HOME/util/devbox/path' >> $HOME/.profile

# relog

cd devbox

auto/setup
