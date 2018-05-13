#
# Title:
#   Ejercicios Computación Estadística - Hoja 7 - Ejercicio 4
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

library(MASS)
library(lattice)

data(Cars93)

colnames(Cars93)

xyplot(MPG.city ~ Weight | Type, data = Cars93,
       main = "Cars(1993 Makes & Models)", ylab = "Gallons per 100 miles",
       panel = function (x, y, ...) {
         panel.xyplot(x, y, ...)
         panel.abline(lm(y ~ x), lty = 2)
       })


xyplot(MPG.city ~ Weight | Type, data = Cars93, groups = AirBags,
       main = "Cars(1993 Makes & Models)", ylab = "Gallons per 100 miles",
       type = "p", pch = 19, auto.key = list(points = T, columns = 3),
       between = list(y = 1, x = 1),
       panel = function (x, y, ...) {
         panel.xyplot(x,y,...)
         panel.lmline(x,y, lty = 2)
       })


xyplot(MPG.highway ~ Weight | Type * Origin, data = Cars93, aspect = 1,
       main = "Consumo en Autopista versus Peso según Tipo de Vehículo y Origen",
       ylab = "Consumo en Autopista", xlab = "Peso",
       between = list(x = 1))
