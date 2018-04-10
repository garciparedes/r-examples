#
# Title:
#   Ejercicios Computación Estadística - Hoja 2 - Ejercicio 2
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
(x <- c(2.3, -1.2, -9.8, 3.5, 8.1, 3.4)) # 2.3 -1.2 -9.8 3.5 8.1 3.4
(y <- c(-4.5, 3.0, 2.4, 8.2, -1.9, -9.1)) # -4.5 3 2.4 8.2 -1.9 -9.1

(z <- c(x, y)) # 2.3 -1.2 -9.8 3.5 8.1 3.4 -4.5 3 2.4 8.2 -1.9 -9.1
z[c(1, 8, 10, 13)] # 2.3 3 8.2 <NA>
# <NA> porque se está accediendo a una posición fuera del vector.

#
# Apartado b)
#
x < 0 | x > 4 # FALSE TRUE TRUE FALSE TRUE FALSE
x[x < 0 | x > 4] # -1.2 -9.8 8.1

x > 0 # TRUE FALSE FALSE TRUE TRUE TRUE
y[x > 0] # -4.5 8.2 -1.9 -9.1

#
# Apartado c)
#

x[2:(length(x) - 1)] <- 0
x # 2.3 0 0 0 0 3.4

#
# Apartado d)
#

names(y) <- LETTERS[1:length(y)]
y[['E']] <- -3.2
y
# A
# -4.5
# B
# 3
# C
# 2.4
# D
# 8.2
# E
# -1.9
# F
# -9.1
