This collection of scripts needs to be run sequencially from 1-3, and then plotting is done rather manually using script 4 in R.
The input files allow a user to recreate the subsampling population estimation implemented in O'Connell et al. 
1) This script will take a pop file:

sample1 north
sample2	south

The script will create separate files call species_north_keep.txt and species_south_keep.txt 
that can be used to split the vcf files in vcftools.

2) Split vcf files into north and south for each species and each dataset using vcftools.

3) This is the main script of the bunch. It takes the split vcffiles and then subsamples them from between 2 and 9
and does this 100 times. It then estimates pop gen stats using Populations (from STACKS2) for each subsampled file. 
It writes all these to an output, removes intermediate files, and then finishes.

4) This script will just create boxplots for each set of values (#of bootstraps). In the paper I did 100 bootstraps. 
