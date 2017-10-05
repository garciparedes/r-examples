#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Práctica 03
#
#

Total <- read.csv('./../../../datasets/villes-2.txt', header=TRUE)

print(colnames(Total))
A <- Total[Total[2,] !='Edition 1991', 48:59]
A <- A[complete.cases(A),]
print(A)
pca1=prcomp(A, scale=TRUE)

print(pca1$sdev^2)
print(pca1$rotation)
print(pca1$x)

print(diag((t(pca1$x) %*% pca1$x)/(nrow(A)-1)))
screeplot(pca1)
biplot(pca1)
library(ggplot2)

scores = as.data.frame(pca1$x)
