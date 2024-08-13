#!/bin/bash

SED="/usr/bin/sed";

for SRC in "$@"; do
    # Convert to smart quotes
    ${SED} -i -r 's/(\s|^)[“"]([^“”"]+)[”"](\s|$)/\1“\2”\3/gm' "${SRC}";
    ${SED} -i -r 's/(\s|^)[‘'\'']([^‘’'\'']+)[’'\''](\s|$)/\1‘\2’\3/gm' "${SRC}";
    ${SED} -i -r 's/(\w)'\''(\w)/\1’\2/g' "${SRC}";

    # Use En-Dashes
    ${SED} -i -r 's/(\w)--/\1—/g' "${SRC}";

    # Use Elipsees
    ${SED} -i -r 's/\.\.\./…/g' "${SRC}";
done 