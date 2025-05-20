#!/bin/bash

# Fetch the latest changes from upstream and origin
git fetch upstream
git fetch origin

# Switch to the develop branch
git checkout develop

# Sync develop branch with upstream
git pull upstream develop

# Merge the feature branch into develop
read -p "Enter the name of the feature branch to merge: " feature_branch
git merge origin/feature/$feature_branch

# Resolve any conflicts if needed

# Push the changes to both origin and upstream
git push origin develop
git push upstream develop

# Checkout back to the feature branch
git checkout feature/$feature_branch

echo "Feature branch $feature_branch merged into develop successfully. Changes pushed to origin and upstream. Switched back to feature branch $feature_branch."