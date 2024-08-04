#!/bin/bash

# List of your repositories
repos=(
    "/home/tanvir/Documents/ObsidianMD"   # for obsidian backup
    "/home/tanvir/0_Codes/ps"    #problem-solving
)

# Loop through each repository
for repo in "${repos[@]}"; do
    cd "$repo" || continue

    echo "Checking $repo..."

    # Fetch latest changes from remote
    git fetch

    # Check for changes
    if [[ $(git status --porcelain) ]]; then
        echo "Changes detected in $repo. Pushing..."
        git add .
        git commit -m "Automated commit message"
        git push
    else
        echo "No changes in $repo."
    fi
done

