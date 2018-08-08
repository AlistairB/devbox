#!/bin/bash
set -Eexuo pipefail

ssh-keygen -t rsa -b 4096 -f ~/.ssh/github_public -C 'alistair@email.com'

cat ~/.ssh/github_public.pub

read -p "Add ssh key to github public and press enter"

mkdir -p ~/util

cd ~/util

sudo apt update && sudo apt install -y git

git clone git@github.com:AlistairB/devbox.git

sudo apt remove -y git

cd devbox

auto/setup
