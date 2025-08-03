#!/bin/bash

PREFIX=$1
CELLFILE=$2
RESO=$3

#!/bin/bash

check_hkl ${PREFIX}.hkl -y 6/mmm -p ${CELLFILE} --highres=${RESO} --nshells=20 --shell-file=check.dat

compare_hkl ${PREFIX}.hkl1 ${PREFIX}.hkl2 -y 6/mmm -p ${CELLFILE} --highres=${RESO} --fom=rsplit --nshells=20 --shell-file=rsplit.dat

compare_hkl ${PREFIX}.hkl1 ${PREFIX}.hkl2 -y 6/mmm -p ${CELLFILE} --highres=${RESO} --fom=ccstar --nshells=20 --shell-file=ccstar.dat

compare_hkl ${PREFIX}.hkl1 ${PREFIX}.hkl2 -y 6/mmm -p ${CELLFILE} --highres=${RESO} --fom=cc --nshells=20 --shell-file=cc.dat

cat rsplit.dat ccstar.dat cc.dat check.dat > statistics.dat

EOF


