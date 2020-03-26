#!/bin/bash

if [ !"$PDF_DIR$" ]
then
    PDF_DIR=~/Documents/PdfManuals/
fi
   
if [ $# -lt 1 ]
then
   echo USAGE $0 COMMAND
   exit
fi

man -t $1 | ps2pdf - $PDF_DIR/$1.pdf
