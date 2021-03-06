library(data.table)

#set folder with the accuracy results
setwd("C:/Users/ca13kute/Documents/bRacatus/Tests_species/Tests_species")

#read all results
results_acc <- lapply(list.files(),read.csv)
results_acc2 <- rbindlist(results_acc) #bind rows
names(results_acc2)[1] <- "Species" #change name of column to species

#include sps names from the file names into the table (fixing details)
results_acc2$Species <- gsub("_"," ",gsub(".csv","",list.files())) 

#set folder with the biogeo results
setwd("C:/Users/ca13kute/Documents/bRacatus/Tests_species/Tests_species_biogeo")

#read all results
results_biogeo <- lapply(list.files(),read.csv)
results_biogeo2 <- rbindlist(results_biogeo) #bind rows
names(results_biogeo2)[1] <- "Species" #change name of column to species

#include sps names from the file names into the table (fixing details)
results_biogeo2$Species <- gsub("_"," ",gsub(".csv","",list.files())) 

#set folder with the taxa info
setwd("C:/Users/ca13kute/Documents/bRacatus/Tests_species")

#load table with taxa info
table_taxa <- read.csv("Table_S2.csv")

#select only relevant rows 
merge_table <- table_taxa[,c(2,3,20,21)]

#include info in the results tables
results_acc3 <- merge(results_acc2,merge_table,by="Species",
                      all.x = T,sort = F)

results_biogeo3 <- merge(results_biogeo2,merge_table,by="Species",
                      all.x = T,sort = F)


#### TAXA

#plot accuracy
boxplot(auc_test ~ Group, data = results_acc3, 
        col = rgb(189,227,139,maxColorValue = 255),
        border = rgb(90,155,45,maxColorValue = 255),
        ylab = "AUC",xlab = "Model input data",boxwex = .2,
        notch = T,names = c("Amphibia","Aves","Mammalia","Plantae"),
        ylim = c(.6,1),xaxs = "i", yaxs = "i", las = 1)

boxplot(rmse_test ~ Group, data = results_acc3, 
        col = rgb(242,187,221,maxColorValue = 255),
        border = rgb(195,20,121,maxColorValue = 255),
        ylab = "RMSE",xlab = "Model input data",boxwex = .2,
        notch = T,names = c("Amphibia","Aves","Mammalia","Plantae"),
        ylim = c(0,.8),xaxs = "i", yaxs = "i", las = 1)

#plot biogeo status
boxplot(auc_test ~ Group, data = results_biogeo3, 
        col = rgb(189,227,139,maxColorValue = 255),
        border = rgb(90,155,45,maxColorValue = 255),
        ylab = "AUC",xlab = "Model input data",boxwex = .2,
        notch = F,names = c("Amphibia","Aves","Mammalia","Plantae"),
        ylim = c(.6,1),xaxs = "i", yaxs = "i", las = 1)

boxplot(rmse_test ~ Group, data = results_biogeo3, 
        col = rgb(242,187,221,maxColorValue = 255),
        border = rgb(195,20,121,maxColorValue = 255),
        ylab = "RMSE",xlab = "Model input data",boxwex = .2,
        notch = T,names = c("Amphibia","Aves","Mammalia","Plantae"),
        ylim = c(0,.8),xaxs = "i", yaxs = "i", las = 1)


#### Continent

#plot accuracy
boxplot(auc_test ~ Cont., data = results_acc3, 
        col = rgb(189,227,139,maxColorValue = 255),
        border = rgb(90,155,45,maxColorValue = 255),
        ylab = "AUC",xlab = "Model input data",boxwex = .2,
        notch = T,cex.axis = .71,
        ylim = c(.6,1),
        xaxs = "i", yaxs = "i", las = 1)

boxplot(rmse_test ~ Cont., data = results_acc3, 
        col = rgb(242,187,221,maxColorValue = 255),
        border = rgb(195,20,121,maxColorValue = 255),
        ylab = "RMSE",xlab = "Model input data",boxwex = .2,
        notch = T,cex.axis = .71,
        ylim = c(0,.8),
        xaxs = "i", yaxs = "i", las = 1)

#plot biogeo status
boxplot(auc_test ~Cont., data = results_biogeo3, 
        col = rgb(189,227,139,maxColorValue = 255),
        border = rgb(90,155,45,maxColorValue = 255),
        ylab = "AUC",xlab = "Model input data",boxwex = .2,
        notch = F,cex.axis = .71,
        ylim = c(.6,1),
        xaxs = "i", yaxs = "i", las = 1)

boxplot(rmse_test ~ Cont., data = results_biogeo3, 
        col = rgb(242,187,221,maxColorValue = 255),
        border = rgb(195,20,121,maxColorValue = 255),
        ylab = "RMSE",xlab = "Model input data",boxwex = .2,
        notch = T,cex.axis = .71,
        ylim = c(0,.8),
        xaxs = "i", yaxs = "i", las = 1)

#### Size

#plot accuracy
boxplot(auc_test ~ Range.size.class, data = results_acc3, 
        col = rgb(189,227,139,maxColorValue = 255),
        border = rgb(90,155,45,maxColorValue = 255),
        ylab = "AUC",xlab = "Model input data",boxwex = .2,
        notch = T,names = c("S1","S2","S3","S4"),
        ylim = c(.6,1),
        xaxs = "i", yaxs = "i", las = 1)

boxplot(rmse_test ~ Range.size.class, data = results_acc3, 
        col = rgb(242,187,221,maxColorValue = 255),
        border = rgb(195,20,121,maxColorValue = 255),
        ylab = "RMSE",xlab = "Model input data",boxwex = .2,
        notch = T,names = c("S1","S2","S3","S4"),
        ylim = c(0,.8),
        xaxs = "i", yaxs = "i", las = 1)

#plot biogeo status
boxplot(auc_test ~Range.size.class, data = results_biogeo3, 
        col = rgb(189,227,139,maxColorValue = 255),
        border = rgb(90,155,45,maxColorValue = 255),
        ylab = "AUC",xlab = "Model input data",boxwex = .2,
        notch = F,names = c("S1","S2","S3","S4"),
        ylim = c(.6,1),
        xaxs = "i", yaxs = "i", las = 1)

boxplot(rmse_test ~ Range.size.class, data = results_biogeo3, 
        col = rgb(242,187,221,maxColorValue = 255),
        border = rgb(195,20,121,maxColorValue = 255),
        ylab = "RMSE",xlab = "Model input data",boxwex = .2,
        notch = T,names = c("S1","S2","S3","S4"),
        ylim = c(0,.8),
        xaxs = "i", yaxs = "i", las = 1)
