rm(list=ls())
setwd("C:/Users/Maxime/OneDrive/PROJET/RENAULT/TABLE_PARC_APV") #go up one level

# packages
source('script/functions_TPAPV.R')

# data repatriation (save them with 'UTF-8' encoding)
ncltr <- read.table('recipe_data/nomenclature.txt', header=T, sep=';', fileEncoding="UTF-8-BOM")
crit <- read.table('recipe_data/association_code_critere.txt', header=T, sep=';', fileEncoding="UTF-8-BOM")
fveh <- read.table('recipe_data/veh_manu_CDGAM-YEAR.txt', header=T, sep=';', fileEncoding="UTF-8-BOM")
bv <- read.table('recipe_data/bvm_brut.txt', header=T, sep=';', fileEncoding="UTF-8-BOM")

## computations


# mtc
des <- give.cdobj(id.mtc=LETTERS[1:length(ncltr$MTCFIX)], mtc=ncltr$MTCFIX, dic.o=crit$CDOBJ, dic.c=crit$CRIT)
des2 <- table(des)
ord  <- list(col=order(colSums(des2)), row=order(rowSums(des2)))
des2[ord$row, ord$col]


# fleet breakdown
eclat <- break_fleet.row.recursive(15, CDG=fveh$CDGAM, YEAR = fveh$YEAR, VOL = fveh$NB_VEH_MANUFACTURED)
eclat$AGE <- as.integer(format(eclat$AGE, "%Y"))
