#!/bin/bash

PANDOC="/usr/bin/pandoc";

SRC="src/chap*.md.txt"

for CHAP in $SRC; do
    WORDS=$(${PANDOC} ${CHAP} -s --strip-comments -t plain | wc -w);
    BYTES=$(${PANDOC} ${CHAP} -s --strip-comments -t plain | wc -c);
    
    printf "Chapter %02d : %'6d w / %'7d B\n" ${CHAP:8:2} ${WORDS} ${BYTES};
done;

WORDS=$(${PANDOC} ${SRC} -s --strip-comments -t plain | wc -w);
BYTES=$(${PANDOC} ${SRC} -s --strip-comments -t plain | wc -c);

printf "     TOTAL : %'6d w / %'7d B\n" ${WORDS} ${BYTES};