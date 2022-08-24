#!/bin/zsh

# Upgrade everything
sudo apt update && sudo apt upgrade -y

# AWS cli
echo -e "complete -C /usr/local/bin/aws_completer aws" >> ~/.zshrc

source ~/.zshrc
