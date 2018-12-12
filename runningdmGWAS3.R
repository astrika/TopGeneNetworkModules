# Astrid M Manuel 12/12/2018
# Using EW_dmGWAS to perform dense module searching on GWAS signals and gene expression profiles
# EW_dmGWAS package: https://bioinfo.uth.edu/dmGWAS/

#Getting data ready for dms function

#Gene-level p-values, or gene weights from PASCAL results
geneweight <- read.table("C:\\Users\\amanuel1\\Dev\\ZhaoLab\\MS\\PASCAL\\geneWeights2011_original.txt", header = T)
#PPI network from HPRD
network <- read.table("C:\\Users\\amanuel1\\Dev\\ZhaoLab\\MS\\HPRD_Release9_062910\\network.txt")

#Obtaining gene expression profiles from GEO by using GEOquery package
#Learn about GEOquery: https://warwick.ac.uk/fac/sci/moac/people/students/peter_cock/r/geo/
source("http://www.bioconductor.org/biocLite.R")
biocLite("GEOquery")
library(Biobase)
library(GEOquery)
#Downloading the GDS file for gene expression profiles
gds4218 <- getGEO('GDS4218', destdir = "C:\\Users\\amanuel1\\Dev\\ZhaoLab\\MS\\GeneExpressionProfiles")
#Creating gene expression matrices for each phenotype
control <- Table(gds4218)[,c(2,3,4)]
brainLesions <- Table(gds4218)[,c(2,5,6,7,8,9)]

#Running dms for EW_dmGWAS
#EW_dmGWAS package: https://bioinfo.uth.edu/dmGWAS/
install.packages("PATH_TO/dmGWAS_3.0.zip",repos=NULL,type="source")
library(igraph)
library(dmGWAS)
dms(geneweight = geneweight, expr1 = control, expr2 = brainLesions, network = network)