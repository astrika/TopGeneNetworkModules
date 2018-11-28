awk {'print$2'} topModulesContent2009o.txt | sort | uniq --count > nonRedundantGenes2009o.txt
