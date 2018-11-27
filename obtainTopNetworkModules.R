# Astrid M Manuel 11/27/2018
# set your node-weighted network to res.list and obtain all modules
load("C:\\users\\amanuel1\\Dev\\ZhaoLab\\MS\\Results\\RESULT.list200950.RData")
allModules <- res.list$genesets.clear

# calculate the number of modules that should be included in your top 1% analysis
top1percent <- ceiling(length(allModules)*0.01)

# get your top 1% modules
top1percentModules <- head(res.list$zi.ordered, top1percent)

# get the seed genes from your top 1% modules for module identifications
top1percentSeedGenes <- top1percentModules$gene


#obtain file of top modules content and all of the non redundant genes
for(gene in top1percentSeedGenes){
  write.table(print(allModules[gene]), file = "topModulesContent.txt", append = T, col.names = F, quote = F)
}
topModulesContent <- read.table("topModulesContent.txt")
topGenes <- topModulesContent[,2]
write.table(print(levels(topGenes)), file = "nonRedundantTopGenes.txt", quote = F)
amountofTopGenes <- length(levels(topGenes))


#print a message for summary of processes done
message(paste("Content for top 1 percent modules was printed.", "\n", "You have", top1percent, "top 1 percent modules, and", amountofTopGenes, "non-redundant genes within these modules."))