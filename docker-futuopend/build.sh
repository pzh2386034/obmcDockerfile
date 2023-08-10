#!/bin/zsh
docker rmi futu-open-d:2.19.1252
docker build --platform linux/x86_64 -t futu-open-d:2.19.1252 .
