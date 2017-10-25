#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Análisis de Correspondencias - Práctica 03
#
#

rm(list = ls())

library(ca)

#
# 1)  Importar los datos a R desde el fichero oscar.csv
#

N <- read.csv(
  './../../../datasets/oscar.csv',
  header=TRUE,
  row.names = 1)
N



#
# 2)  Efectuar un análisis de correspondencias múltiples con el paquete ac con
# solo las variables médicas como activas a partir de la matriz de binaria, a
# partir de la matriz de Burt y con un análisis de correspondencias conjunto y
# comparar los resultados.
#

N_medicas <- N[,-c(1,2,3,4)]
N_medicas_mca1 <- mjca(N_medicas, lambda="indicator")
N_medicas_mca2 <- mjca(N_medicas, lambda="Burt")
N_medicas_mca3 <- mjca(N_medicas, lambda="JCA")

summary(N_medicas_mca1)
summary(N_medicas_mca2)
summary(N_medicas_mca3)

plot(N_medicas)

#
# 3)  ¿Cuál es la categoría peor representada en el plano definido por los 2
# primeros factores? ¿Y cuál es la mejor representada?
#

# La categoría peor representada en todos los casos es la aparicion.subita,
# mientras que la mejor representada es vacunado.temporada.anterior


#
# 4)  Incluir las variables demográficas edad y sexo como suplementarias. Para
# ello categorizar edad en 4 categorías de la siguiente forma: 1 para menores de
# 18, 2 entre 18 y 35, 3 entre 36 y 65, 4 más de 65 años. Rehacer el análisis a
# partir de la matriz de Burt mediante correspondencias simples.
#

N_copy <- N[,-c(1,2,4)]
N_copy[N_copy[,1] < 18,1] = 1
N_copy[N_copy[,1] >= 18 & N_copy[,1] <= 35,1] = 2
N_copy[N_copy[,1] >= 36 & N_copy[,1] < 65,1] = 3
N_copy[N_copy[,1] >= 65,1] = 4
N_copy[,1]

N_copy_mca1 <- (mjca(N_copy, lambda="Burt", colsup=c(1)))
summary(N_copy_mca1)
N_copy_mca1$Burt
N_copy_mca1$sv
summary(ca(N_copy_mca1$Burt))

#
# 5)  ¿Cuánto vale la inercia recogida por las variables suplementarias en el
# primer factor?
#

#
# Las variables suplementarias no contribuyen a la generación de los factores,
# por tanto, no generan inercia en el análisis.
#


#
# 6)  Efectuar una representación conjunta de las proyecciones de filas y
# columnas e interpretar los factores y el resultado del análisis.
#

plot(N_copy_mca1, what = c("none","all"))
