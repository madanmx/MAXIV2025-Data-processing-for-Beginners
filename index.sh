#!/bin/bash
#variables are indexing and cell


CELL=Crlov.cell
GEOMETRY=jf.geom


INDEXING=mosflm
INTRADIUS=2,5,7
MINPIXCOUNT=2
MINPEAKS=6
SNR=4
THRESHOLD=5


for LIST in *.lst
	 do 
		sbatch -p all --exclusive  --time=08:00:00 -J indexamajig -e indexamajig_%j.err <<EOF
#!/bin/bash
module purge
module load gopresto PReSTO
module load CrystFEL/0.11.1-PReSTO-12.0

NPROC=$(grep proc /proc/cpuinfo | wc -l )

mkdir -p temp;
mkdir -p stream_files

indexamajig -j \$NPROC -i ${LIST} -g ${GEOMETRY} -o ./stream_files/${LIST}.stream --indexing=mosflm,xgandalf-latt-cell --peaks=peakfinder8 -p $CELL --threshold=$THRESHOLD --int-radius=$INTRADIUS --integration=rings-grad --local-bg-radius=3 --min-snr=$SNR --multi --min-peaks=$MINPEAKS --local-bg-radius=3 --min-pix-count=$MINPIXCOUNT --mille --max-mille-level=2 --temp-dir=./temp > ${LIST}.log 2>&1
EOF

done

