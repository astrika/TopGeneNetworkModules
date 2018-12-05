# Astrid M Manuel 11/27/2018
# Top 1% network modules from dmGWAS results are examined for the highest association scores

study <- "2009o"
# set your node-weighted network to res.list and obtain all modules
load(paste("C:\\users\\amanuel1\\Dev\\ZhaoLab\\MS\\Results\\RESULT.list", study, ".RData", sep=""))
allModules <- res.list$genesets.clear
total <- length(allModules)

# calculate the number of modules that should be included in your top 1% analysis
top1percent <- ceiling(length(allModules)*0.01)

# get your top 1% modules
top1percentModules <- head(res.list$zi.ordered, top1percent)

# get gene set enrichment analysis input
write.table(top1percentModules[,c(1,3)], file = paste("Zn", study,".txt",sep=""), append = T, quote = F, row.names = F, col.names = F, sep = "\t")

# get the seed genes from your top 1% modules for module identifications
top1percentSeedGenes <- top1percentModules$gene


#obtain file of top modules content and all of the non redundant genes
for(gene in top1percentSeedGenes){
  write.table(print(getElement(allModules,gene)), file = paste("topModulesContent", study,".txt", sep=""), append = T, col.names = F, quote = F)
}

#print a message for summary
message(paste("Content for top 1 percent modules was printed.", "\n", "Out of", total, "modules you have", top1percent, "top 1 percent modules."))
