rm(list=ls())
load("OutputITS.RData")		### output downloaded from Calcul Canada Coralie's folder
rm(list=setdiff(ls(),c("seqtab.nochim","taxa")))	### Keep only the community and taxonomy
x=seqtab.nochim
y=x[!sapply(strsplit(rownames(x),"-"),'[',1)%in%1:50,]	### Keep only samples whose name isn't 1:50 (Coralie's samples)
y=y[1:54,]	### remove the last line
comm=y	### store the final community in object "comm"
rm(list=setdiff(ls(),c("comm","taxa")))	### clean up the environment
save.image("Amy_ITS.RData")	### export/save

