#!/bin/bash

docker run -e PASSWORD=nilm --platform=linux/amd64 --rm -p 8888:8888 -v ./notebooks:/workspace/notebooks -v ./dataset:/workspace/dataset -it nilmtk
