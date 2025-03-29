#!/usr/bin/env bash

DIR=$(date '+/Users/francischua/.arbtt/logs/%Y')
FILE=$(date '+/Users/francischua/.arbtt/logs/%Y/%m.log')

mkdir -p $DIR

/usr/local/bin/arbtt-capture -r 60 -f $FILE
