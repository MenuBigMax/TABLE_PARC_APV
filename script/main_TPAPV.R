rm(list=ls())
setwd("C:/Users/Maxime/OneDrive/PROJET/RENAULT/TABLE_PARC_APV")

# packages


# data repatriation
ncltr <- read.table('data/nomenclature.txt', header=T, sep='\t', fileEncoding = 'ANSI_X3.4-1986')
crit <- read.table('data/association_code_critere.txt', header=T, sep='\t', fileEncoding = 'ANSI_X3.4-1986')

## computations
