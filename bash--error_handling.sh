#!/bin/bash

localDirectory="/home/root/temp/test"

mkrid  -p $localDirectory
if [[ $? != 0 ]];
then 
    echo "Failed to create directory";
    exit 1;
else
    echo "Directort created";
fi
