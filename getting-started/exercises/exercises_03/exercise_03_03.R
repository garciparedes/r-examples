#
# Title:
#   Ejercicios Computación Estadística - Hoja 3 - Ejercicio 3
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())



library(MASS)

data(road)

write.table(road,"carretera-1.txt")
dump("road", file = "carretera-2.R")
save(road, file = "carretera-3.Rdata")

rm(road)

read.table("carretera-1.txt")
source("carretera-2.R")
load("carretera-3.Rdata")
