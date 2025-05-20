#!/bin/bash

# Fetch the latest changes from upstream and origin
git fetch upstream
git fetch origin

# Switch to your feature branch
read -p "Enter your feature branch name: " feature_branch
git checkout $feature_branch

# Rebase the feature branch on top of develop
git rebase upstream/develop

# Resolve any conflicts if needed

# Push the changes to origin (with --force to overwrite if necessary)
git push origin $feature_branch --force

# Push the changes to upstream
git push upstream $feature_branch --force

echo "Feature branch $feature_branch rebased on develop successfully. Changes pushed to origin and upstream."