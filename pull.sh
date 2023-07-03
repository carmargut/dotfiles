#!/bin/bash

echo "--------------------------------------" 
echo "$(date)"

repo_path="~/.dotfiles/"
eval repo_path="$repo_path" # Expand the path containing ~

# Change to the repo's directory
cd "$repo_path" || exit

# Do a git pull of main
git checkout master
git pull origin master
git checkout - # goes back to the last branch
