import os
import sys
import subprocess as sp
import shutil
import argparse
import random
'''
fh_out.write('# Pop ID'+'\t'+'Private	Sites'+'\t'+'Variant_Sites'+'\t'+"Polymorphic_Sites"+'\t'+"%Polymorphic_Loci"\
+'\t'+"Num_Indv"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"P"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Obs_Het"+'\t'+"Var"+'\t'+"StdErr"\
+'\t'+"Obs_Hom"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Exp_Het"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Exp_Hom"+'\t'+"Var"+'\t'+"StdErr"\
+'\t'+"Pi"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Fis"+'\t'+"Var"+'\t'+"StdErr"+"\n")


'''

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--in_dir", required=True, help="REQUIRED: The full path to a directory which contains the input alignment files.")
    parser.add_argument("-b", "--boots", required=True, help="REQUIRED: Number of bootstraps.")
    parser.add_argument("-m", "--max_ind", required=True, help="REQUIRED: Max number of individuals to randomly sample.")

    return parser.parse_args()
	
###begin loop 1:100
###Subsample the files, then run populations	
def subsample_loop(in_dir,boots,max_ind):
	os.chdir(in_dir)
	
	pops_list = ['north','south']
	infile_list = []
	#make a list to get the species names for each dataset
	fh_sp = open('species_list.txt' ,'r');sp_list = []
	for line in fh_sp:line=line.strip();sp_list.append(line)

	for species in sp_list:
		north_list=[]
		south_list=[]
		#open the pop maps for each species
		pop_map = species + '_pops.txt' #ind\tnorth or ind\tsouth
		fh_pop = open(pop_map,'r') #open file
		for line in fh_pop:
			line=line.strip() #remove line breaks
			if line.split('\t')[1] == 'south': 
				south_list.append(line.split('\t')[0]) #make list so calculate length of each pop below
			else:
				north_list.append(line.split('\t')[0]) #same list to calc length
	############# Run loop to create temp downsampled vcf files at the smallest common pop size ##############
		for filetype in os.listdir('.'):
			if filetype.endswith('north.vcf') or filetype.endswith('south.vcf'):
				infile_list.append(filetype)
		infile_set = set(infile_list)
		for infile in infile_set:
			if species in infile:
					
				outfile = infile.split('.')[0]+'_sumstats_summary_combined.txt'
				fh_out = open(outfile,'a')
				
				fh_out.write('# Pop ID'+'\t'+'Private	Sites'+'\t'+'Variant_Sites'+'\t'+"Polymorphic_Sites"+'\t'+"%Polymorphic_Loci"\
				+'\t'+"Num_Indv"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"P"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Obs_Het"+'\t'+"Var"+'\t'+"StdErr"\
				+'\t'+"Obs_Hom"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Exp_Het"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Exp_Hom"+'\t'+"Var"+'\t'+"StdErr"\
				+'\t'+"Pi"+'\t'+"Var"+'\t'+"StdErr"+'\t'+"Fis"+'\t'+"Var"+'\t'+"StdErr"+"\n")


				for i in range(int(boots)): #create 100 bootstrap loops
					j= random.randrange(2,int(max_ind))
					print j
				
					
					sub_len = min(len(north_list),len(south_list)) ########can also do min +1 to add some for poecilonotus
					out = infile.split('.')[0]+'_temp.'+str(i)+'_'+str(j)
					vcf_sub = "vcftools --vcf {0} --max-indv {1} --recode --out {2} ".format(infile,j,out)
					proc_sub = sp.call(vcf_sub,shell=True)
				
					pops_in = out+'.recode.vcf'
					populations_call = "populations -V {0} -O .".format(pops_in)
					proc_populations = sp.call(populations_call,shell=True)
					
					
					sumstats = pops_in.split('.')[0] + '.'+ pops_in.split('.')[1]+'.recode' + '.p.sumstats_summary.tsv'
					last_line = open(sumstats, "r").readlines()[-1]
					
					#write last line to file
					fh_out.write(last_line)

																
			#remove log files
			for filetype in os.listdir('.'):
					if filetype.endswith('.log') or filetype.endswith('.tsv') or 'temp' in filetype:
						os.remove(filetype)


		
def main():
	#define the arguments
	args = get_args()
	subsample_loop(args.in_dir,args.boots,args.max_ind)
	
if __name__ == '__main__':
    main()	
	
	
	
	
	