#
# Title:
#   Ejercicio Computación Estadística - Glucos
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#

rm(list = ls())

getwd()

(glucosa <- read.table("./../../datasets/glucosa.txt", header = TRUE))

nrow(glucosa) # 31

list(ncol(glucosa), colnames(glucosa))
# 3
# 'glucosa' 'temperatura' 'enfermera'

apply(glucosa, 2, summary)
# glucosa	temperatura	enfermera
# Min.	70.00000	35.00000	1.000000
# 1st Qu.	79.50000	35.90000	1.000000
# Median	84.00000	36.30000	2.000000
# Mean	86.77419	36.45806	1.935484
# 3rd Qu.	91.00000	37.30000	2.500000
# Max.	131.00000	38.00000	3.000000
