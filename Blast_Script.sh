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
