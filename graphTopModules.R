# Astrid M Manuel 11/28/2018
# graphing top 1 % modules with simpleChoose() ***run after aquiring top modules

#graph top modules
install.packages("igraph")
library(igraph)
install.packages("c:\\users\\amanuel1\\Dev\\ZhaoLab\\MS\\dmGWAS_2.4.tar.gz",repos=NULL,type="source")
library(dmGWAS)
simpleChoose(res.list, top = top1percent, plot = T)