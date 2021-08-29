#!/bin/bash

if [ $# -ge 1 ] && [ -d ${1} ]; then
    if [ -f ${1}/Dockerfile ]; then
        IFS='/' read -ra TAGS <<< "${1}"
        echo "Building ${TAGS[0]}:${TAGS[1]} image. Please be patient; this may take a while.\n"
        
        docker build --tag "${TAGS[0]}:${TAGS[1]}" ${1}
    else
        echo "Error: No Dockerfile present for ${1}"
    fi
else
    echo "Please specify a valid directory for the desired Docker image"
fi