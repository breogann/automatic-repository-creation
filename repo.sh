#!/bin/bash

# 1. Creating the remote & local repos
curl -u $1 https://api.github.com/user/repos -d "{ \"name\": \"$2.git\" ,\"private\": \"true\"}" 
git clone https://github.com/$1/$2.git

cd $2
touch README.md
echo ".ipynb_checkpoints
/.ipynb_checkpoints/
**/.DS_Store"> .gitignore

git add .
git commit -m "commit zero"
git push -u origin master
git status

echo "
HAPPY CODING! 💪🏻😀
"

# 2. Setting up the work environment: VSC, Finder, Jupyter & iTerm tab
code .
open .

open -a iTerm .

jupyter notebook
open http://localhost:8888