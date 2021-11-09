#!/bin/bash

#SBATCH -J autometa
#SBATCH -p stajichlab
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --mem=40gb
#SBATCH --output=slurm_log/%x_elk_dung.out

module load autometa
input_dir=../results/spades
output_dir=../results/autometa
sample='10740.6.176469.AGTTCC.anqdpht'

input=${input_dir}/${sample}
output=${output_dir}/${sample}

threads=16

# Calculate Read Coverage
cov_out=${output}/cov_out
mkdir -p ${cov_out}

#calculate_read_coverage.py \
#    --assembly ${input}/scaffolds.fasta \
#    --processors ${threads} \
#    --forward_reads ${input}/split_input/${sample}_1.fastq \
#    --reverse_reads ${input}/split_input/${sample}_2.fastq \
#	--output_dir ${cov_out}


make_taxonomy_table.py \
	--assembly ${input}/scaffolds.fasta \
	--processors ${threads} \
	--length_cutoff 3000 \
	--cov_table ${cov_out}/coverage.tab \
	--output_dir ${output}

# run_autometa.py \
# 	--kingdom bacteria \
# 	--assembly ${output}/Bacteria.fasta \
# 	--ML_recruitment
# 	--processors ${threads} \
# 	--length_cutoff 1500 \
# 	--taxonomy_table ${output}/taxonomy.tab \
# 	--cov_table $COVTAB \
# 	--output_dir ${output}/Bacteria_run
