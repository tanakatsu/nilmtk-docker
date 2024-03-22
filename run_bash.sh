#!/bin/bash

docker run --platform=linux/amd64 --rm -v ./scripts:/workspace/scripts -v ./dataset:/workspace/dataset -it nilmtk /bin/bash
