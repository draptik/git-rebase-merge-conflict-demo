#!/bin/sh

# Git alias lg
# alias.lg=log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

BASEDIR="${PWD}/.."

# ==============================================================================
# Project setup ----------------------------------------------------------------
#
# Quick & Dirty
#
# - 2 users ('homer' and 'lisa')
# - 'server' (in this demo: just another folder called 'myApp.git')
#
# Folder structure after initial setup:
# .
# ├── homer
# │   └── myApp
# │       └── readme.txt
# ├── lisa
# │   └── myApp
# │       └── readme.txt
# ├── myApp.git    # the 'server'
#  [...]
# └── script
#     └── demo.sh  # (this file)

## Clear demo folders
cd $BASEDIR
rm -rf myApp
rm -rf myApp.git
rm -rf homer
rm -rf lisa

## create some initial code
mkdir myApp && cd myApp
echo "Hi there." > readme.txt

## git: create, configure & commit repository (local)
git init
git config --local user.email "marge@springfield.com" && git config --local user.name "Marge"
git add .
git commit -am"initial commit"

## create 'git server' (origin): clone current project ('.') to sibling folder ('myApp.git')
git clone --bare . ../myApp.git

## set 'server' as remote origin
git remote add origin ../myApp.git
git push --set-upstream origin master

## Add users, checkout project and configure git users
cd ${BASEDIR} && mkdir homer && cd homer && git clone ../myApp.git && cd myApp && git config --local user.email "homer@springfield.com" && git config --local user.name "Homer"
cd ${BASEDIR} && mkdir lisa && cd lisa && git clone ../myApp.git && cd myApp && git config --local user.email "lisa@springfield.com" && git config --local user.name "Lisa"

## Remove initial folder
cd ${BASEDIR} && rm -rf myApp

## Show folder structure on console
tree

# END Project setup ------------------------------------------------------------
# ==============================================================================



## First commit by Homer: add frontend file ------------------------------------
cd ${BASEDIR}/homer/myApp

echo "/* the user interface */" > frontend.js

### local commit
git add .
git commit -am"added frontend"

### git best practice: get current state using rebase
git pull --rebase

### git push to server
git push

## First commit by Lisa: add backend file -------------------------------------
cd ${BASEDIR}/lisa/myApp

echo "/* the backend */" > backend.txt

### local commit
git add .
git commit -am"added backend"

### git best practice: get current state using rebase
git pull --rebase

### git push to server
git push

## Homer does coding, pull+rebase, git push (HAPPY CASE) -----------------------
cd ${BASEDIR}/homer/myApp

echo "var message = 'first change'" >> frontend.txt
echo "/* new frontend file */" > frontend2.txt

### local commit
git add .
git commit -am"added first change to frontend"

### git best practice: get current state using rebase
git pull --rebase

### git push to server
git push

echo "Git log: Server -----------"
cd ${BASEDIR}/myApp.git && git lg
echo "Git log: Homer -----------"
cd ${BASEDIR}/homer/myApp && git lg
echo "Git log: Lisa -----------"
cd ${BASEDIR}/lisa/myApp && git lg

## Lisa does coding, pull+rebase, git push (HAPPY CASE) ------------------------
cd ${BASEDIR}/lisa/myApp

echo "var info = 'first change to backend.'" >> backend.txt
echo "/* new backend file */" > backend2.txt

### local commit
git add .
git commit -am"added first change to backend"

### git best practice: get current state using rebase
git pull --rebase

### git push to server
git push

echo "Git log: Server -----------"
cd ${BASEDIR}/myApp.git && git lg
echo "Git log: Homer -----------"
cd ${BASEDIR}/homer/myApp && git lg
echo "Git log: Lisa -----------"
cd ${BASEDIR}/lisa/myApp && git lg

# MERGE CONFLICTS ==============================================================
#
# TODO

