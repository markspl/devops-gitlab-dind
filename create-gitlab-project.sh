#!/bin/sh
cd ./project
git init

git config user.name "Administrator"
git config user.email "admin@example.com"

#git push --set-upstream http://gitlab-web/root/project.git master
#git push --set-upstream http://localhost:8080/root/project.git master
#git push --set-upstream http://localhost:8080/root/project.git master
#git remote add origin http://gitlab-web/root/project.git

git remote add origin http://localhost:8080/root/project.git

git add .
git commit -m "Initial commit"
#git push -u origin master
git push --set-upstream http://localhost:8080/root/project.git master
