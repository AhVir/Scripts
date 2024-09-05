#!/bin/bash

# Define log file
LOGFILE="/home/tanvir/gitpush.log"

# List of your repositories
repos=(
    "/home/tanvir/0_Codes/ps"
    "/home/tanvir/Documents/ObsidianMD/"
)

# Loop through each repository
for repo in "${repos[@]}"; do
    cd "$repo" || continue

    echo "$(date): Checking $repo..." >> "$LOGFILE"

    # Fetch latest changes from remote
    git fetch >> "$LOGFILE" 2>&1

    # Check for changes
    if [[ $(git status --porcelain) ]]; then
        echo "$(date): Changes detected in $repo. Pushing..." >> "$LOGFILE"
        git add . >> "$LOGFILE" 2>&1
        git commit -m "Automated commit message" >> "$LOGFILE" 2>&1
        git push >> "$LOGFILE" 2>&1
    else
        echo "$(date): No changes in $repo." >> "$LOGFILE"
    fi
done
