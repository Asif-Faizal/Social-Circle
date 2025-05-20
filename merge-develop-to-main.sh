#!/bin/bash

# Fetch the latest changes from upstream and origin
git fetch upstream
git fetch origin

# Switch to the main branch
git checkout main

# Sync main branch with upstream
git pull upstream main

# Merge the develop branch into main
git merge origin/develop

# Resolve any conflicts if needed

# Push the changes to both origin and upstream
git push origin main
git push upstream main

echo "Develop branch merged into main successfully. Changes pushed to origin and upstream."