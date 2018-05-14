#
# Title:
#   Ejercicios Computación Estadística - Hoja 4 - Ejercicio 8
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

datos <- data.frame("Semana1" = c(45, 35),
                    "Semana2" = c(56, 47),
                    row.names = c("Favorable", "Desfavorable"))

#
# Apartado b)
#
barplot(as.matrix(datos)[,1] / sum(datos$Semana1), main = "Resultados Campaña (Semana 1)")



#
# Apartado c)
#
barplot(as.matrix(datos), beside = TRUE, main = "Resultados Campaña")
barplot(as.matrix(datos), main = "Resultados Campaña")
