setwd("~/Desktop/CHIPdata/")

library(seqinr)
####The FASTA files contain peak sequences indicating where the genes are located in relation to the proteins of interest (HTAS-1 and HTZ-1)
####Storing the information from the FASTA file and reading it as a one element list as well as being able to identify where the introns and exons are located throughout each sequence.
HTASseq <- read.fasta("HTAS_sequence.fasta", as.string = TRUE, forceDNAtolower = FALSE)
HTZseq <- read.fasta("HTZ_sequence.fasta", as.string = TRUE, forceDNAtolower = FALSE)

####Making a vector copy of the all the information from the FASTA file and storing it into a data frame containing both sequence name and the actual gene sequence for both HTAS-1 and HTZ-1. 
sequence <- unlist(HTASseq)
All.df <- as.data.frame(sequence, row.names(sequence))
sequence_a <- unlist(HTZseq)
All.data <- as.data.frame(sequence_a, row.names(sequence))

####create a column called NumberOfIntrons that holds the number of introns for each sequence
for (i in 1:nrow(All.df)) All.df$NumberOfIntrons[i] =
  length((which(unlist(gregexpr("[a-z]+",All.df$sequence[i]))>0)))
####create a column called NumberOfExons that holds the number of exons for each sequence
for (i in 1:nrow(All.df)) All.df$NumberOfExons[i] =
  length((which(unlist(gregexpr("[A-Z]+",All.df$sequence[i]))>0)))

####create a column called NumberOfIntrons that holds the number of introns for each sequence
for (i in 1:nrow(All.data)) All.data$NumberOfIntrons[i] =
  length((which(unlist(gregexpr("[a-z]+",All.data$sequence[i]))>0)))
####create a column called NumberOfExons that holds the number of exons for each sequence
for (i in 1:nrow(All.data)) All.data$NumberOfExons[i] =
  length((which(unlist(gregexpr("[A-Z]+",All.data$sequence[i]))>0)))

####Creating a histogram for number of introns in HTAS-1 per sequence given across the gene
hist(All.df$NumberOfIntrons,xlim=c(0,10),ylim=c(0,7000),breaks=20,col=rgb(1,1,0,0.7),main="Frequency vs Number of Introns",xlab="Number of Introns")
####This allows for overlapping of HTAS-1 and HTZ-1 data
par(new=TRUE)
####Creating a histogram for HTZ-1 data
hist(All.data$NumberOfIntrons,xlim=c(0,10),ylim=c(0,7000),breaks=20,axes=FALSE,col=rgb(0,1,1,0.4),main="",xlab="",ylab="")
####Creating a legend to illustrate which colors correspond to which histone variant based on the data given.
legend(6, 6000, legend=c("HTZ-1", "HTAS-1", "Overlap"),col=c("Light Blue","Yellow", "Light Green"),lty=1, cex=0.8)

####Creating a histogram for number of exons in HTAS-1 per sequence given across the gene
hist(All.df$NumberOfExons,xlim=c(0,10),ylim=c(0,7000),breaks=20,col=rgb(1,0,1,0.7),main="Frequency vs Number of Exons",xlab="Number of Exons")
####This allows for overlapping of HTAS-1 and HTZ-1 data
par(new=TRUE)
####Creating a histogram for HTZ-1 data
hist(All.data$NumberOfExons,xlim=c(0,10),ylim=c(0,7000),breaks=20,axes=FALSE,col=rgb(1,0.9,0,0.4),main="",xlab="",ylab="")
####Creating a legend to illustrate which colors correspond to which histone variant based on the data given. 
legend(6, 6000, legend=c("HTAS-1", "HTZ-1", "Overlap"),col=c("Purple","Yellow", "Coral"),lty=1, cex=0.8)
