#!/bin/bash

TODAY=date "+%Y-%m-%d"
cd ~/code/knowledge
git add .
git commit -am "Daily update ${TODAY}"
git push -u origin master

yadm add -u
yadm commit -m "Daily update ${TODAY}"
