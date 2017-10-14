#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Análisis de Componentes Principales - Práctica 01
#
#

# library(gdata)
suppressMessages(library(gdata))

DATA <- read.xls('./../../../datasets/olympic-2016.xls')
print(DATA)
A <- as.matrix(DATA[,1:10])
# print(A)

X <- t((t(A) - colMeans(A)) / apply(A, 2, sd))
X_start = (t(X) %*% X ) / (dim(X)[1] - 1)
# print(X_start)

X_lambda <- eigen(X_start)$values
X_u <- eigen(X_start)$vector
# print(X_u)

S <- X %*% X_u

scores = as.data.frame(S)
# print(scores)

library(ggplot2)
ggplot(data = scores, aes(x=V1, y=V2, label=DATA[,12])) +
  geom_point() +
  geom_text()
