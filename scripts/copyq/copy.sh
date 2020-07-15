#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Usage cq-cp WORD..."
    exit 1;
fi

copyq add $@
copyq select 0
