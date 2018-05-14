#
# Title:
#   Ejercicios Computación Estadística - Hoja 3 - Ejercicio 4
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

library(readxl)

path <- "./../../../datasets/"

misdatos <- read_xlsx(paste0(path, "castillayleon.xlsx"),
                      sheet = "pcaxis", skip = 11,
                      col_names = c("Año", "Ambos Sexos", "Varones", "Mujeres"))

write.table(misdatos, file = "misdatos.txt")

write.csv(misdatos, file = "misdatos.csv")
