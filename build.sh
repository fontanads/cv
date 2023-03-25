#!/bin/bash
docker build --progress=plain -t simple_cv .
docker rm simple_cv 
docker run --name simple_cv simple_cv  # don't detach -d because you need to wait for pdflatex compilation
docker cp simple_cv:$(docker inspect --format='{{.Config.WorkingDir}}' simple_cv)/SimpleCV.pdf ./
