#!/usr/bin/env bash

set -e # -e: exit on error

echo -e "\033[0;32m>>>>> Start bluefin-cli <<<<<\033[0m"

mkdir -p ~/.config/containers/systemd

wget --quiet --output-document ~/.config/containers/systemd/bluefin-cli.container \
    https://raw.githubusercontent.com/auricom/dotfiles/main/private_dot_config/private_containers/systemd/bluefin-cli.container.tmpl

systemctl --user daemon-reload

systemctl --user start bluefin-cli
