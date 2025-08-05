#!/bin/bash
# key file for rvm
sudo timedatectl set-timezone America/Los_Angeles

brew install chezmoi
chezmoi init --apply
