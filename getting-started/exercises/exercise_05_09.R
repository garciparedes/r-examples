#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 9
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())


#
# Apartado a)
#

poblacion <- read.table("./../../datasets/provincias-pob.txt",
                        col.names = c("Provincia", "Poblacion"))

poblacion$Provincia <- as.factor(gsub("[[:digit:]]+-", "", poblacion$Provincia))

table(sample(poblacion$Provincia, 2000, replace = TRUE))
table(sample(poblacion$Provincia, 2000, prob=poblacion$Poblacion, replace = TRUE))
