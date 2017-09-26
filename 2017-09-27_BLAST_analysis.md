## This is a markdown note sheet stating and summarizing the analysis of amplicon sequences trimmed and run against the NCBI database, using Blast
###Professor: Naupaka Zimmerman
### Date of Assignment: 2017-09-22 to 2017-09-27
### Project Owner: Katelyn Kukar; kbkukar@usfca.edu

## Project Overview:
#### Create a script which downloads multiple amplicon sequences in fastq format. Trim and align the sequeneces within each file utilizing a code loop to record the basic output. Run the output against the NCBI database via Blast to provide evidence for or against the Fierer Paper that established this experiment.
#### The Fierer paper discusses the diversity of skin-associated bacterial communities and their ability to colonize objects tounched by their host (electronic devices).

## Primary Question:
#### Does the sequencing data match bacterial colonies found on humans or from regions that participants  within the study could have received them from.

## Analysis
### Analysis of species variants:
#### Quantification of the number of different species visualized through blast is listed within the file "unique_outputs.txt." This file lists the number of times a certain species was sequences for throughout all the data files.
#### The top 5 most common species were:
##### 1. *Solemya pervernicosa gill symbiont* (2372 times sequenced)
##### 2. *Bartonella washoensis* (1583 times sequenced)
##### 3. *Bacteroidetes endosymbiont of Metaseiulus occidentalis* (1164 times sequenced)
##### 4. *Aquitalea sp. KJ011* (571 times sequenced)
##### 5. *Pinus oocarpa* (392 times sequenced)

#### *Solemya pervernicosa gill symbiont* is a bacteria that resides in the taxa of sulfur-oxidizing symbionts. This means this bacteria usually requires a host environment where in which its cohabitation benefits the host. The sulfur-oxidizing symbionts tend to inhabit marine hosts, much as the classification *Soleyma pervernicosa* defines. *Soleyma pervernicosa* is a small bivalve, salt-water clam that resides in shallow marine habitats. Concluding that the sulfur-oxidizing feature of this symbiont is to give nutrition to the bivalve since it naturally lacks a digestive system.

#### *Bartonella washoensis*: Bacterium that can cause meningitis in humans, but is more readily present in squirrels and dogs.
#### *Bacteroidetes endosymbiont of Metaseiulus occidentalis*: Bacteriodetes are armored scaled insects with endosymbiont populations and in this example represents a mite. Mites are related to ticks and utilize host environments to gather nutrients.
#### *Aquitalea sp. KJ011*: The genus Aquitalea is from the proteobacteria with many forms being found in lakes.
#### *Pinus oocarpa*: This is a species of pine tree related to Mexico and Central America



#### By deducing that the most readily sequenced species variant is a bacteria endemic to a marine clam population, not humans or very humanoid regions, we can conclude there may be potential error in our sequencing results. To test the quality of the matches we must visualize them within our blast files. This percent match data per species variant can be seen in percentmatche_outputs.txt in the output folder.

#### 1. *Solemya pervernicosa gill symbiont* receives a percent match score of 86.16% overall. This leaves a margin of 13.84% for error.
##### Error within blast results can be attributed to our trimming or alignment, however the shear number of sequences received and attributed to this specific organism lends to more statistical anlysis for proof of error against the null hypothesis of a match.
#### 2. *Bartonella washoensis 99.56-100% match
#### 3. *Bacteroidetes endosymbiont of Metaseiulus occidentalis* 97.76-100% match
#### 4. *Aquitalea sp. KJ011* 94.84% match                    
#### 5. *Pinus oocarpa* 96.02-100% match
 
