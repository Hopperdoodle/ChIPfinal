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
