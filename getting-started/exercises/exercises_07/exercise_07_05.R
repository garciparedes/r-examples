#
# Title:
#   Ejercicios Computación Estadística - Hoja 7 - Ejercicio 5
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

rm(list = ls())
library(lattice)
path <- "./../../../datasets/"

source(paste0(path, "padron.R"))

XX <- as.data.frame(XX)
XX <- data.frame(names = reorder(row.names(XX), XX$total.hombres +
                                                XX$total.mujeres), XX)
barchart(names ~ total.hombres + total.mujeres,
         data = XX,
         auto.key = list(space = "top", columns = 2),
         main = "Población de cada sexo en las CCAA")
