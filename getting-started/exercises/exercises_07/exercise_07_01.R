#
# Title:
#   Ejercicios Computación Estadística - Hoja 7 - Ejercicio 1
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

rm(list = ls())

library(MASS)
library(lattice)

data(stormer)

head(stormer)


xyplot(Time ~ Viscosity, data = stormer,  type = "b",
       main = "Stormer viscometer calibration data",
       auto.key = list(space = "top", columns = 3),
       groups = factor(Wt, labels = list("20"  = "20mg",
                                         "50"  = "50mg",
                                         "100" = "100mg" )))


xyplot(Time ~ Viscosity | factor(Wt, labels = list("20"  = "20mg",
                                                   "50"  = "50mg",
                                                   "100" = "100mg" )),
       data = stormer, layout = c(3,1),type = c("p", "r"), col.line = "red",
       main = "Stormer viscometer calibration data", aspect = 1)
