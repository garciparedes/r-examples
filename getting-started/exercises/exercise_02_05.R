#
# Title:
#   Ejercicios Computación Estadística - Hoja 2 - Ejercicio 5
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
(nombre  <- c("Ana", "Luis", "Pedro", "Juan", "Eva", "Jorge")) # 'Ana' 'Luis' 'Pedro' 'Juan' 'Eva' 'Jorge'
(edad    <- c(23,    24,     22,      24,     21,    22)) # 23 24 22 24 21 22
(sexo    <- c("M",   "H",    "H",     "H",    "M",   "H")) # 'M' 'H' 'H' 'H' 'M' 'H'

#
# Apartado b)
#

(sexf <- factor(sexo)) # M H H H M H
levels(sexf) # 'H' 'M'

#
# Apartado c)
#

(amigos <- data.frame(nombre, edad, sexo))
# nombre	edad	sexo
# Ana	23	M
# Luis	24	H
# Pedro	22	H
# Juan	24	H
# Eva	21	M
# Jorge	22	H

#
# Apartado d)
#

by(amigos$edad, amigos$sexo, mean)
# amigos$sexo: H
# [1] 23
# ------------------------------------------------------------
# amigos$sexo: M
# [1] 22
