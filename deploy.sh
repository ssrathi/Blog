#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -ge 1 ]
  then msg="$1"
fi
git commit -m "$msg" -s

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

# Commit the blog repo now
git add .
git commit -m "$msg" -s

# Push to blog repo
git push origin master

