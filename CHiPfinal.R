setwd("~/Downloads")
HTAS <- read.table("HTAS.C.bed")
HTZ <- read.table("HTZ.1.bed")

library(seqinr)
HTASseq <- read.fasta("HTAS_sequence.fasta", as.string = TRUE, forceDNAtolower = FALSE)
HTZseq <- read.fasta("HTZ_sequence.fasta", as.string = TRUE, forceDNAtolower = FALSE)

sequence <- unlist(HTASseq)
All.df <- as.data.frame(sequence, row.names(sequence))

sequence_a <- unlist(HTZseq)
All.data <- as.data.frame(sequence_a, row.names(sequence))

for (i in 1:nrow(All.df)) All.df$NumberOfIntrons[i] =
  length((which(unlist(gregexpr("[a-z]+",All.df$sequence[i]))>0)))
for (i in 1:nrow(All.data)) All.data$NumberOfIntrons[i] =
  length((which(unlist(gregexpr("[a-z]+",All.data$sequence[i]))>0)))
