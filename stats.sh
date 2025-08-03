#!/bin/bash

# Usage: ./script.sh HKLFILE CELLFILE RESOLUTION SYMMETRY

HKLFILE=$1
CELLFILE=$2
RESO=$3
SYMMETRY=$4

# Check for required arguments
if [ $# -ne 4 ]; then
  echo "Usage: $0 <HKLFILE_BASE> <CELLFILE> <RESOLUTION> <SPACE_GROUP>"
  exit 1
fi

# Run checks
check_hkl "${HKLFILE}.hkl" -y "${SYMMETRY}" -p "${HKLFILE}" --highres="${RESO}" --nshells=20 --shell-file=check.dat

# Run comparisons with different figures of merit
compare_hkl "${HKLFILE}.hkl1" "${HKLFILE}.hkl2" -y "${SYMMETRY}" -p "${HKLFILE}" --highres="${RESO}" --fom=rsplit --nshells=20 --shell-file=rsplit.dat
compare_hkl "${HKLFILE}.hkl1" "${HKLFILE}.hkl2" -y "${SYMMETRY}" -p "${HKLFILE}" --highres="${RESO}" --fom=ccstar --nshells=20 --shell-file=ccstar.dat
compare_hkl "${HKLFILE}.hkl1" "${HKLFILE}.hkl2" -y "${SYMMETRY}" -p "${HKLFILE}" --highres="${RESO}" --fom=cc --nshells=20 --shell-file=cc.dat

# Combine all statistics into a single file
cat rsplit.dat ccstar.dat cc.dat check.dat > statistics.dat
