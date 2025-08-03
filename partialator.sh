#!/bin/bash
#SBATCH --job-name=partialator_micromax

# Usage:
# ./partialator.sh dataset 6/mmm

INPUTSTREAM=$1
SYMMETRY=$2

if [ -z "$INPUTSTREAM" ] || [ -z "$SYMMETRY" ]; then
  echo "Usage: $0 <input_stream_file_without_extension> <symmetry_group>"
  exit 1
fi

sbatch --exclusive --time=20:00:00 -J partialator -e partialator_%j.err <<EOF
#!/bin/sh
module load gopresto PReSTO
module load CrystFEL/0.11.1-PReSTO-12.0

NPROC=$(grep proc /proc/cpuinfo | wc -l )

partialator -j \$NPROC -i ${INPUTSTREAM}.stream -o ${INPUTSTREAM}.hkl -y ${SYMMETRY} --model=unity --iterations=1 > partialator.log 2>&1
EOF
