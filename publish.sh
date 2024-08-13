#!/bin/bash

DIRNAME="/usr/bin/dirname";
BASENAME="/usr/bin/basename";
PANDOC="/usr/bin/pandoc";

for SRC in "$@"; do
    PATH=$(${DIRNAME} ${SRC});
    BASE=$(${BASENAME} ${SRC});
    ${PANDOC} ${SRC} -s --strip-comments -t plain -o ${PATH}/../out/${BASE%.md.txt}.txt;
done