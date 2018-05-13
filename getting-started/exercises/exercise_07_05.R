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

library(lattice)
source("./../../datasets/padron.R")



barchart(names ~ total.hombres + total.mujeres,
         data = data.frame(names = reorder(row.names(XX), XX$total.hombres +
                                                          XX$total.mujeres), XX),
         auto.key = list(space = "top", columns = 2),
         main = "Población de cada sexo en las CCAA")
