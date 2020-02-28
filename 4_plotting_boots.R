library(ggplot2)
library(gridExtra)
#install.packages('gridExtra')

setwd('~/Dropbox/Projects/Manuscripts/Submitted/Rhaco_captures/VCF_files/vcf_thinning')

#catamitus
cat_full_north = read.delim('cat_full_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
cat_full_north[1] <- 'north'
head(cat_full_north)
cat_full_north[1]
cat_full_south = read.delim('cat_full_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
cat_full_south[1] <- 'south'
head(cat_full_south)
cat_full = rbind(cat_full_north,cat_full_south)
cat_full$Private
plot_c_full = ggplot(cat_full, aes(x=cat_full$X..Pop.ID, y = cat_full$Pi)) + geom_boxplot(color = c('#987CB5','#FEB635')) +
  labs(x = "pop", y = 'diversity') + ggtitle("catamitus Full-locus") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.2)
plot_c_full 


cat_exonic_north = read.delim('cat_exonic_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
cat_exonic_north[1] <- 'north'
head(cat_exonic_north)
cat_exonic_north[1]
cat_exonic_south = read.delim('cat_exonic_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
cat_exonic_south[1] <- 'south'
head(cat_exonic_south)
cat_exonic = rbind(cat_exonic_north,cat_exonic_south)
plot_c_exonic = ggplot(cat_exonic, aes(x=cat_exonic$X..Pop.ID, y = cat_exonic$Pi,color = cat_exonic$X..Pop.ID)) + geom_boxplot(color = c('#987CB5','#FEB635')) + 
  labs(x = "pop", y = 'diversity') + ggtitle("catamitus Exonic") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.2)
plot_c_exonic

#modestus
mod_full_north = read.delim('mod_full_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
mod_full_north[1] <- 'north'
head(mod_full_north)
mod_full_north[1]
mod_full_south = read.delim('mod_full_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
mod_full_south[1] <- 'south'
head(mod_full_south)
mod_full = rbind(mod_full_north,mod_full_south)
plot_m_full = ggplot(mod_full, aes(x=mod_full$X..Pop.ID, y = mod_full$Pi,color = mod_full$X..Pop.ID)) + geom_boxplot(color = c('#987CB5','#FEB635')) + 
  labs(x = "pop", y = 'diversity') + ggtitle("modestus Full-locus") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.2)
plot_m_full

mod_exonic_north = read.delim('mod_exonic_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
mod_exonic_north[1] <- 'north'
head(mod_exonic_north)
mod_exonic_north[1]
mod_exonic_south = read.delim('mod_exonic_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
mod_exonic_south[1] <- 'south'
head(mod_exonic_south)
mod_exonic = rbind(mod_exonic_north,mod_exonic_south)
plot_m_exonic = ggplot(mod_exonic, aes(x=mod_exonic$X..Pop.ID, y = mod_exonic$Pi,color = mod_exonic$X..Pop.ID)) + geom_boxplot(color = c('#987CB5','#FEB635')) + 
  labs(x = "pop", y = 'diversity') + ggtitle("modestus Exonic") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.2)
plot_m_exonic

#poecilonotus
poe_full_north = read.delim('poe_full_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_full_north[1] <- 'north'
head(poe_full_north)
poe_full_north[1]
poe_full_south = read.delim('poe_full_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_full_south[1] <- 'south'
head(poe_full_south)
poe_full = rbind(poe_full_north,poe_full_south)
plot_p_full = ggplot(poe_full, aes(x=poe_full$X..Pop.ID, y = poe_full$Pi,color = poe_full$X..Pop.ID)) + geom_boxplot(color = c('#987CB5','#FEB635')) + 
  labs(x = "pop", y = 'diversity') + ggtitle("poecilonotus Full-locus") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.35)
plot_p_full

poe_exonic_north = read.delim('poe_exonic_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_exonic_north[1] <- 'north'
head(poe_exonic_north)
poe_exonic_north[1]
poe_exonic_south = read.delim('poe_exonic_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_exonic_south[1] <- 'south'
head(poe_exonic_south)
poe_exonic = rbind(poe_exonic_north,poe_exonic_south)
plot_p_exonic = ggplot(poe_exonic, aes(x=poe_exonic$X..Pop.ID, y = poe_exonic$Pi,color = poe_exonic$X..Pop.ID)) + geom_boxplot(color = c('#987CB5','#FEB635')) + 
  labs(x = "pop", y = 'diversity') + ggtitle("poecilonotus Exonic") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.4)
plot_p_exonic

#put it all together
pdf('subsample_captures.pdf',6,8)
grid.arrange(plot_c_full, plot_c_exonic, plot_m_full, plot_m_exonic, plot_p_full, plot_p_exonic)
dev.off()

####RADS
setwd('~/Dropbox/Projects/Manuscripts/Submitted/Rhaco_captures/VCF_files/RAD_VCFS/')

#catamitus
cat_rads_r70_north = read.delim('cat_rad_r70_north_sumstats_summary_combined.txt',sep = '\t', header = T)
cat_rads_r70_north[1] <- 'north'
head(cat_rads_r70_north)
cat_rads_r70_north[1]
cat_rads_r70_south = read.delim('cat_rad_r70_south_sumstats_summary_combined.txt',sep = '\t', header = T)
cat_rads_r70_south[1] <- 'south'
head(cat_rads_r70_south)
cat_rads_r70 = rbind(cat_rads_r70_north,cat_rads_r70_south)

plot_c_rads_r70 = ggplot(cat_rads_r70, aes(x=cat_rads_r70$X..Pop.ID, y = cat_rads_r70$Pi)) + geom_boxplot(color = c('#987CB5','#FEB635')) +
  labs(x = "pop", y = 'diversity') + ggtitle("catamitus ddRADseq") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.2)
plot_c_rads_r70 

#modestus
mod_rads_r70_north = read.delim('mod_rad_r70_north_sumstats_summary_combined.txt',sep = '\t', header = T)
mod_rads_r70_north[1] <- 'north'
head(mod_rads_r70_north)
mod_rads_r70_north[1]
mod_rads_r70_south = read.delim('mod_rad_r70_south_sumstats_summary_combined.txt',sep = '\t', header = T)
mod_rads_r70_south[1] <- 'south'
head(mod_rads_r70_south)
mod_rads_r70 = rbind(mod_rads_r70_north,mod_rads_r70_south)
mod_rads_r70$Private

plot_m_rads_r70 = ggplot(mod_rads_r70, aes(x=mod_rads_r70$X..Pop.ID, y = mod_rads_r70$Pi)) + geom_boxplot(color = c('#987CB5','#FEB635')) +
  labs(x = "pop", y = 'diversity') + ggtitle("modestus ddRADseq") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.2)
plot_m_rads_r70 


#poecilonotus
poe_rads_r70_north = read.delim('poe_rad_r70_north_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_rads_r70_north[1] <- 'north'
head(poe_rads_r70_north)
poe_rads_r70_north[1]
poe_rads_r70_south = read.delim('poe_rad_r70_south_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_rads_r70_south[1] <- 'south'
head(poe_rads_r70_south)
poe_rads_r70 = rbind(poe_rads_r70_north,poe_rads_r70_south)
poe_rads_r70$Private

plot_p_rads_r70 = ggplot(poe_rads_r70, aes(x=poe_rads_r70$X..Pop.ID, y = poe_rads_r70$Pi)) + geom_boxplot(color = c('#987CB5','#FEB635')) +
  labs(x = "pop", y = 'diversity') + ggtitle("poecilonotus ddRADseq") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.2)
plot_p_rads_r70 

grid.arrange(plot_c_rads_r70, plot_m_rads_r70, plot_p_rads_r70)

#put it all together
pdf('subsample_rads.pdf',4,8)
grid.arrange(plot_c_rads_r70, plot_m_rads_r70, plot_p_rads_r70)
dev.off()

pdf('subsample_all_datasets.pdf',8,10)
grid.arrange(plot_c_full, plot_c_exonic, plot_c_rads_r70, plot_m_full, plot_m_exonic, plot_m_rads_r70, plot_p_full, plot_p_exonic,plot_p_rads_r70)
dev.off()

#poe_pruned without hybrid
#poecilonotus
setwd('~/Dropbox/Projects/Manuscripts/Submitted/Rhaco_captures/VCF_files_plus_bootstrap_diversity/bootstrap_diversity_captures/poecilonotus_pruned')
poe_full_north = read.delim('poe_full_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_full_north[1] <- 'north'
head(poe_full_north)
poe_full_north[1]
poe_full_south = read.delim('poe_full_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_full_south[1] <- 'south'
head(poe_full_south)
poe_full = rbind(poe_full_north,poe_full_south)
plot_p_full = ggplot(poe_full, aes(x=poe_full$X..Pop.ID, y = poe_full$Pi,color = poe_full$X..Pop.ID)) + geom_boxplot(color = c('#987CB5','#FEB635')) + 
  labs(x = "pop", y = 'diversity') + ggtitle("poecilonotus Full-locus") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.35)
plot_p_full

poe_exonic_north = read.delim('poe_exonic_all_north_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_exonic_north[1] <- 'north'
head(poe_exonic_north)
poe_exonic_north[1]
poe_exonic_south = read.delim('poe_exonic_all_south_sumstats_summary_combined.txt',sep = '\t', header = T)
poe_exonic_south[1] <- 'south'
head(poe_exonic_south)
poe_exonic = rbind(poe_exonic_north,poe_exonic_south)
plot_p_exonic = ggplot(poe_exonic, aes(x=poe_exonic$X..Pop.ID, y = poe_exonic$Pi,color = poe_exonic$X..Pop.ID)) + geom_boxplot(color = c('#987CB5','#FEB635')) + 
  labs(x = "pop", y = 'diversity') + ggtitle("poecilonotus Exonic") + theme(legend.position = "none") + 
  theme(plot.title = element_text(hjust = 0.5)) + ylim(0.0,0.4)
plot_p_exonic



