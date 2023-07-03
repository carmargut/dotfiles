#!/bin/bash

echo "--------------------------------------"
echo "$(date)"

repo_path="~/.dotfiles/"
eval repo_path="$repo_path" # Expand the path containing ~

# Change to the repo's directory
cd "$repo_path" || exit

# Check if there are any changes
if [[ -n $(git status -s) ]]; then
    # Create the commit message with the current date
    commit_message=$(date +"%Y%m%d")

    # Commit and push the changes
    git add .
    git commit -m "$commit_message"
    git push origin master
else
    echo "No changes in the repository."
fi