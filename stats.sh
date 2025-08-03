#!/bin/bash

HKLFILE=$1
CELLFILE=$2
RESO=$3

#!/bin/bash

check_hkl ${HKLFILE}.hkl -y 6/mmm -p ${HKLFILE} --highres=${RESO} --nshells=20 --shell-file=check.dat

compare_hkl ${HKLFILE}.hkl1 ${HKLFILE}.hkl2 -y 6/mmm -p ${HKLFILE} --highres=${RESO} --fom=rsplit --nshells=20 --shell-file=rsplit.dat

compare_hkl ${HKLFILE}.hkl1 ${HKLFILE}.hkl2 -y 6/mmm -p ${HKLFILE} --highres=${RESO} --fom=ccstar --nshells=20 --shell-file=ccstar.dat

compare_hkl ${HKLFILE}.hkl1 ${HKLFILE}.hkl2 -y 6/mmm -p ${HKLFILE} --highres=${RESO} --fom=cc --nshells=20 --shell-file=cc.dat

cat rsplit.dat ccstar.dat cc.dat check.dat > statistics.dat

EOF


