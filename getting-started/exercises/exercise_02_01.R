#
# Title:
#   Ejercicios Computación Estadística - Hoja 2 - Ejercicio 1
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   March 2018
#


rm(list = ls())

#
# Apartado a)
#

getwd() # '~garciparedes/development/r/'

setwd("~garciparedes/development/r/r-examples/getting-started/exercises")
getwd() # '~garciparedes/development/r/r-examples/getting-started/exercises

#
# Apartado b)
#

(edad <- c(19, 21, 19, 22, 21)) # 19 21 19 22 21

mean(edad) # 20.4

#
# Apartado c)
#

(serie <- seq(1, 50)) # 1 2 ... 49 50

sum(serie) # 1275
sum(serie ^ 2) # 42925
sum(serie ^ 3) # 1625625

(serie.multiplos.tres <- seq(1, 10) * 3) # 3 6 9 12 15 18 21 24 27 30
sum(serie.multiplos.tres) # 165

#
# Apartado d)
#

rep(1:2, 3) # 1 2 1 2 1 2
rep(1:3, each = 2) # 1 1 2 2 3 3
rep(1:5, times = 1:5) # 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5

#
# Apartado e)
#

seq(55, 59) # 55 56 57 58 59
seq(1, 11, 2) # 1 3 5 7 9 11
seq(1, 10, 0.1) # 1 1.1 1.2 1.3 ... 9.7 9.8 9.9 10

#
# Apartado f)
#

(x = c(3, log(-15), 5)) # 3 NaN 5
(x[!is.nan(x)]) # 3 5

#
# Apartado g)
#

Inf + Inf # Inf
Inf + 0 # Inf
0 / 0 # NaN
4 / 0 #Inf
NA / 0 # <NA>
NA + Inf # <NA>
NULL - Inf # No hay salida
0 ^ 0 # 1
Inf ^ 0 # 1
