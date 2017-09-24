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

for file in data/raw_data/*.fastq
do
# Info on the Trimmomatic tool available here: http://www.usadellab.org/cms/index.php?page=trimmomatic
# Trim Sequences for all Fastq files
	echo "trimming files"
	TrimmomaticSE -threads 2 -phred33 $file data/trimmed/$(basename -s .fastq $file).trim.fastq LEADING:5 TRAILING:5 SLIDINGWINDOW:8:25 MINLEN:150
	echo "sequences trimmed"
done

for file in data/trimmed/*.trim.fastq
do
# Use Bioawk to convert trimmed sequences in to Blast format
	echo "converting trimmed sequences to fasta format for Blast"
	bioawk -c fastx '{print ">"$name"\n"$seq}' $file > $(basename -s .fastq $file).fasta
	echo "trimmed files now in fasta format"
done

# Move all new fasta format files intro trimmed directory
mv *.trim.fasta  data/trimmed
echo "fasta files in trimmed directory"

# Code to Blast trimmed fasta sequences
# -db sets which database to use, in this case the nucleotide database
# -num_threads is how many different processor threads to use
# -outfrmt is the output format, further info available here:
# https://www.ncbi.nlm.nih.gov/books/NBK279675/
# -o is the filename to save the results in
# -max_target_seqs is the number of matches to return for each query
# -negative_gilist tells BLAST which sequences to exclude from matches
# This cuts down on the number of uncultured or environmental matches
# -query is the fasta file of sequences we want to search for matches to


# code used to blast singular file and received -query error "Argument "query". File is not accessible: 'ERR1942280.trim.fasta'
blastn -db /blast-db/nt -num_threads 2 -outfmt '10 sscinames std' -out $file_blast_results.csv -max_target_seqs 1 -negative_gilist /blast-db/2017-09-21_GenBank_Environmental_Uncultured_to_Exclude.txt -query data/trimmed/ERR1942280.trim.fasta


# code for blast in a for loop
echo"for file in data/trimmed/*.trim.fasta"
do
	echo "blastn -db /blast-db/nt -num_threads 2 -outfmt '10 sscinames std' -out output/blast/$file_blast_results.csv -max_target_seqs 1 -negative_gilist /blast-db/2017-09-21_GenBank_Environmental_Uncultured_to_Exclude.txt -query $file"
done"

