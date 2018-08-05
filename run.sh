#!/bin/bash
set -Eexuo pipefail

# generate github_public key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/github_public -C <&0

cat ~/.ssh/github_public.pub

read -p "Add ssh key to github public and press enter"

mkdir -p ~/util/devbox

git clone git@github.com:AlistairB/devbox.git

cd ~/util/devbox

auto/setup
