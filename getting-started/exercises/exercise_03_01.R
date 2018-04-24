#
# Title:
#   Ejercicios Computación Estadística - Hoja 3 - Ejercicio 1
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

matriculaciones <- read.table("./../../datasets/matriculaciones2.txt", header = TRUE)

#
# Apartado a.1 )
#
matriculaciones[ ,"SEAT", drop = FALSE]

#
# Apartado a.2 )
#
matriculaciones["Madrid", , drop = FALSE]

#
# Apartado a.3 )
#
provincias <- c("Leon", "Palencia", "Burgos", "Zamora", "Valladolid",
                "Soria", "Salamanca", "Avila", "Segovia")
marcas <- c("CITROEN", "FORD", "OPEL", "PEUGEOT",
            "RENAULT", "SEAT", "VOLKSWAGEN")
sum(matriculaciones[provincias, marcas]) # 45542

#
# Apartado b)
#
(matriculaciones.global <- data.frame(
  provincia = rownames(matriculaciones),
  coches    = rowSums(matriculaciones), row.names = NULL
))
