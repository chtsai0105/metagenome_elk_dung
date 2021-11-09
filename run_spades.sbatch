#!/bin/bash

#SBATCH -J spades
#SBATCH -p stajichlab
#SBATCH -n 1
#SBATCH -c 12
#SBATCH --mem=250gb
#SBATCH --output=slurm_log/%x_elk_dung.out

module load spades
input_dir=../data
output_dir=../results/spades
sample=SRR06169${SLURM_ARRAY_TASK_ID}
sample='10740.6.176469.AGTTCC.anqdpht.fastq.gz'
#in1=$input_dir/${sample}_1_trim.fastq
#in2=$input_dir/${sample}_2_trim.fastq
in=$input_dir/${sample}

mkdir -p $output_dir/$sample

spades.py --meta -o $output_dir/$sample --12 $in -t 12
