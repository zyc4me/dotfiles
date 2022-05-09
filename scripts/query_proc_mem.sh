#!/bin/bash
# This script print how many memory each process occupis in MB
# https://stackoverflow.com/a/44711589/2999096

ps -eo size,pid,user,command --sort -size | \
    awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=2 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }' |\
    cut -d "" -f2 | cut -d "-" -f1
