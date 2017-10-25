#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Correspondence Analysis - Sport
#
#

rm(list = ls())

library(ggplot2)
suppressMessages(library(gdata))

DATA <- read.xls('./../../datasets/sport.xls')

N <- as.matrix.data.frame(DATA[,2:6])
rownames(N) <- DATA[,1]
N

F <- N / sum(N)
F

Dc <- diag( colSums(N) / sum(N))
Dc

Dr <- diag( rowSums(N) / sum(N))
Dr


Pc <- solve(Dc) %*% t(F)
Pc

Pr <- solve(Dr) %*% F
Pr

X <- t(F) %*% solve(Dr) %*% F %*% solve(Dc)

X_eigen <- eigen(X)
X_lambda <- X_eigen$values
X_u_1 <- X_eigen$vectors

X_u_norm <- diag(t(X_u_1) %*% solve(Dc) %*% X_u_1)

X_u <- t(t(X_u_1) / sqrt(X_u_norm))

fact <-solve(Dc) %*% X_u

Proyec_r <- Pr %*% fact

ggplot(data=as.data.frame.matrix(Proyec_r), aes(x=V2, y=V3)) +
  geom_point() +
  geom_text(label=rownames(N))
