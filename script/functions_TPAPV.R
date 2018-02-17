# From columns of manufactured vehicle volumes (DATA FUNCTION FORMAT) :
# - CDGAM x YEAR is the primary key
# - VOL is manufactured vehicle volumes
# - A is the horizon asked for the fleet breakdown
# Return a rows-table where :
# - CDGAM x YEAR x AGE is the primary key
# - fleet

break_fleet.row.recursive <- function(A, CDG, YEAR, VOL){
  D <- data.frame(CDG=CDG, YEAR=YEAR, VOL=VOL)
  D$YEAR <- D$YEAR+A-1
  D <- cbind(D, AGE=as.POSIXct(paste0(formatC(A, width=4, flag=0), '-12-31'), format="%Y-%m-%d", origin="1990-01-01"))
  if(A==1) return(D) else return(rbind(D, break_fleet.row.recursive(A-1, CDG, YEAR, VOL)))
  return(D)
}

# From columns of mtc and a dictionary (DATA FUNCTION FORMAT) :
# - id.mtc, mtc : (nx1) columns of MTC and its identity
# - dic.o, dic.c : (kx1) columns of object code and its associated criteria
# Return a rows-table where : 
# - id.mtc is the MTC identity above
# - cobj is one of the object code concered by the MTC


give.cdobj <- function(id.mtc, mtc, dic.o, dic.c){
  mtc <- as.character(mtc)
  n <- length(mtc)
  
  # matrix of special characters position
  p <- data.frame(id.mtc=id.mtc, mtc=mtc, suiv=NA, comma=NA, slash=NA, last=NA, tocomp=NA, end=NA, crit=NA)
  p$comma <- as.integer(regexpr(",", mtc))-1
  p$slash <- as.integer(regexpr("/", mtc))-1
  p$last <- nchar(mtc)
  
  p$tocomp <- apply(p[,c('comma', 'slash', 'last')], 1, function(a) min(a[a>0], na.rm=T))
  p$end <- p$slash<0
  
  # criteria searching in the dictionary
  dic <- data.frame(crit=dic.c, cdobj=dic.o)
  p$crit <- substr(mtc, 1, p$tocomp)
  p <- merge(p, dic, 'crit', all.x=T, all.y=F)
  
  # next iteration
  p$suiv <- mapply(substr, x=p$mtc, start=p$slash+2, stop=p$last)
  
  if(sum(p$end)==n) return(p[, c('id.mtc', 'cdobj')]) else return(rbind(p[, c('id.mtc', 'cdobj')], give.cdobj(p$id.mtc[!p$end], p$suiv[!p$end], dic.o, dic.c)))
}