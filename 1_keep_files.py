species_file = 'species_list.txt' 
sp_list = []
fh_sp = open(species_file,'r')
pops_list = ['north','south']
for line in fh_sp:
	line=line.strip()
	sp_list.append(line)

########Keep file for splitting vcfs########
for species in sp_list: #iterate through each species
	#parse the pop maps and write north and south keep files
	north = species + '_north_keep.txt'
	south = species + '_south_keep.txt'
	fh_north = open(north,'a')
	fh_south = open(south,'a')
	
	#open the pop maps for each species
	pop_map = species + '_pops.txt' #ind\tnorth or ind\tsouth
	fh_pop = open(pop_map,'r') #open file
	for line in fh_pop:#iterate through file
		line=line.strip() #remove line breaks
		if line.split('\t')[1] == 'south': #if southern, write to the south keep file
			fh_south.write(line.split('\t')[0]+'\n')
		else:
			fh_north.write(line.split('\t')[0]+'\n') #else write to north file