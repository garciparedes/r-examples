#
# Title:
#   Ejercicios Computación Estadística - Hoja 2 - Ejercicio 3
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
(x <- sample(1:100, 15)) # 99 59 19 94 60 92 43 11 89 37 70 54 9 71 67

#
# Apartado b)
#
sort(x) # 9 11 19 37 43 54 59 60 67 70 71 89 92 94 99
rev(sort(x)) # 99 94 92 89 71 70 67 60 59 54 43 37 19 11 9

#
# Apartado c)
#
x[order(x)] # 9 11 19 37 43 54 59 60 67 70 71 89 92 94 99
x[rev(order(x))] # 99 94 92 89 71 70 67 60 59 54 43 37 19 11 9

#
# Apartado d)
#

order(x) # 13 8 3 10 7 12 2 5 15 11 14 9 6 4 1
order(rank(x)) # 13 8 3 10 7 12 2 5 15 11 14 9 6 4 1
# El resultado es el mismo porque rank() genera un vector que da valores de
# menor a mayor según el valor del vector originarl, por lo que la ordenación
# es equivalente
