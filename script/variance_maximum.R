rm(list=ls())
N <- 10^7
X <- rcauchy(N, location = 45, scale = 0.2)
X <- X^runif(N)/X%%rbinom(N, 7, 0.4)

N.na <-  length(is.na(X))
X[is.na(X)] <- abs(rnorm(N.na, 46/rbinom(N.na, 5, 0.9), runif(N.na, 0, 9)))*rpois(N.na, 0.6)
summary(X)

