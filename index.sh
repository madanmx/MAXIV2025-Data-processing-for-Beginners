#!/bin/bash
#Parameters filled with example values
CELL=file.cell
GEOMETRY=file.geom

INDEXING=mosflm #Recommendation; try indexing methods like xgandalf 
INTRADIUS=2,5,7
MINPIXCOUNT=2
MINPEAKS=6
SNR=4
THRESHOLD=5

#run this script in the same directory where the required dataset.lst file is
for LIST in *.lst
	 do 
		sbatch -p all --exclusive  --time=08:00:00 -J indexamajig -e indexamajig_%j.err <<EOF
#!/bin/bash
module purge
module load gopresto PReSTO
module load CrystFEL/0.11.1-PReSTO-12.0
##I always prefer to use the lastest version of crystfel

NPROC=$(grep proc /proc/cpuinfo | wc -l )

mkdir -p temp;
mkdir -p stream_files

#change the parmaters acccording to your experiment.
indexamajig -j \$NPROC -i ${LIST} -g ${GEOMETRY} -o ./stream_files/${LIST}.stream --indexing=mosflm,xgandalf-latt-cell --peaks=peakfinder8 -p $CELL --threshold=$THRESHOLD --int-radius=$INTRADIUS --integration=rings-grad --local-bg-radius=3 --min-snr=$SNR --multi --min-peaks=$MINPEAKS --local-bg-radius=3 --min-pix-count=$MINPIXCOUNT --mille --max-mille-level=0 --temp-dir=./temp > ${LIST}.log 2>&1
EOF

done

