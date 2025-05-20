#!/bin/bash

# Check if you're on a feature branch
current_branch=$(git branch --show-current)
if [[ ! "$current_branch" =~ ^feature/ ]]; then
  echo "You are not on a feature branch. Please switch to a feature branch first."
  exit 1
fi

# Add all changes
git add .

# Commit changes with a message
read -p "Enter your commit message: " commit_message
git commit -m "$commit_message"

# Push changes to origin
git push origin $current_branch

# Push changes to upstream (only if it's a feature branch)
git push upstream $current_branch

echo "Changes pushed to $current_branch on origin and upstream successfully."