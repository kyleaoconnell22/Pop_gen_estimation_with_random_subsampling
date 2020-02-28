import os
import sys
import subprocess as sp
from subprocess import Popen,PIPE
import subprocess
import shutil

#file with the species names that match the prefix of vcf and pop files
#in this case, cat, mod, poe
species_file = 'species_list.txt' 
sp_list = []
fh_sp = open(species_file,'r')
pops_list = ['north','south']
for line in fh_sp:
	line=line.strip()
	sp_list.append(line)


for species in sp_list: #iterate through each species

########Use vcftools to split north and south vcf########
	for filetype in os.listdir('.'): #iterate through dir
		if filetype.endswith('.vcf') and species in filetype: #grab only vcf file for each species
			
			prefix = filetype.split('.')[0] #find prefix of file
			if "north" not in prefix and 'south' not in prefix: #make sure we don't analyze files twice
	
				for loc in pops_list:
					#use vcftools to split the file using the north south pop assigns make above
					k = species+'_'+loc+'_keep.txt'
					o = prefix+'_'+loc
					#call_string = "vcftools --vcf poe_full_all.vcf --keep poe_north_keep.txt --recode --out poe_full_all_north"
					#proc_call = subprocess.call(call_string,shell=True)

					call_string = "vcftools --vcf {0} --keep {1} --recode --out {2}".format(filetype,k,o)
					proc_call = sp.call(call_string,shell=True)
			
	for filename in os.listdir('.'):
		if filename.endswith('.log'):
			os.remove(filename)
		elif filename.endswith('.recode.vcf'):
			rename=filename.split('.')[0]+'.vcf'
			os.rename(filename,rename)
			
