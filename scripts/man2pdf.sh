#!/bin/bash

if [ !"$PDF_DIR$" ]
then
    PDF_DIR=~/Documents/PdfManuals/
fi
   
if [ $# -lt 1 ]
then
   echo USAGE $0 COMMAND...
   exit
fi

for cmd in $@
do
    man -t ${cmd} | ps2pdf - $PDF_DIR/${cmd}.pdf
done

