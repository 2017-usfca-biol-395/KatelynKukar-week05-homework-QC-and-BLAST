#!/bin/bash
# This is a project setup for BionInformatics Homework Week 5
# This project's main goal is to Blast multiple sequences that have been trimmed to establish, which organisms are present in the data and to analyze the importance of visualizing these specific organisms in relation to the study
# The study of interest is by Fierer et al relating bacterial communities on the skin to bacteria recovered from surfaces of contact

# Katelyn Kukar kbkukar@usfca.edu
date

# This is a short code to establish shell variables needed to Blast specific fasta files
if [ -z ${BLASTDB} ]; then source /home/.bashrc; export PATH; export BLASTDB; fi

echo "Downloading Data"
# move and download data into raw_data folder
# the pipe and tail -n +2 is a handy way to exclude the first line
for SRA_number in $(cut -f 6 data/metadata/fierer_forensic_hand_mouse_SraRunTable.txt | tail -n +2)
do
    fastq-dump -v $SRA_number -O data/raw_data
done
echo "Download completed and moved to raw data"

# Covert Fastq files to HTML in output directory
fastqc data/raw_data/*.fastq --outdir=output/fastqc

for file in $@
do
# Info on the Trimmomatic tool available here: http://www.usadellab.org/cms/index.php?page=trimmomatic
# Trim Sequences for all Fastq files
echo "trimming files"
	TrimmomaticSE -threads 2 -phred33 data/raw_data/$file data/trimmed/$(basename -s .fastq $file).trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
done
echo "sequences trimmed"

for file in $@
do
# Use Bioawk to convert trimmed sequences in to Blast format
echo "converting trimmed sequences to fasta format for Blast"
	bioawk -c fastx '{print ">"$name"\n"$seq}' data/trimmed/$file
done
echo "trimmed files now in fasta format"
