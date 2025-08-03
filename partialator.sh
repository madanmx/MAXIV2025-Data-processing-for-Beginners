#!/bin/bash
#SBATCH --job-name partialator_micromax


#to run
#./partialator.sh file.stream

$INPUTSTREAM=$1

sbatch --exclusive  --time=20:00:00 -J partialator -e partialator_%j.err <<EOF

#!/bin/sh

module load gopresto PReSTO
module load CrystFEL/0.11.1-PReSTO-12.0

NPROC=$(grep proc /proc/cpuinfo | wc -l )

partialator -j \$NPROC -i $INPUTSTREAM.stream -o $INPUTSTREAM.hkl -y 6/mmm --model=unity --iterations=10  > partialator.log 2>&1
EOF
