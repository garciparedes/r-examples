#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Correspondence Analyis - Práctica 03
#
#

rm(list = ls())


#
# 1)  Importar los datos a R desde el fichero oscar.csv
#

N <- data.matrix(read.csv(
  './../../../datasets/oscar.csv',
  header=TRUE,
  row.names = 1))
print(N)


#
# 2)  Efectuar un análisis de correspondencias múltiples con el paquete ac con
# solo las variables médicas como activas a partir de la matriz de binaria, a
# partir de la matriz de Burt y con un análisis de correspondencias conjunto y
# comparar los resultados.
#

library(ca)


#
# 3)  ¿Cuál es la categoría peor representada en el plano definido por los 2
# primeros factores? ¿Y cuál es la mejor representada?
#


#
# 4)  Incluir las variables demográficas edad y sexo como suplementarias. Para
# ello categorizar edad en 4 categorías de la siguiente forma: 1 para menores de
# 18, 2 entre 18 y 35, 3 entre 36 y 65, 4 más de 65 años. Rehacer el análisis a
# partir de la matriz de Burt mediante correspondencias simples.
#


#
# 5)  ¿Cuánto vale la inercia recogida por las variables suplementarias en el
# primer factor?
#


#
# 6)  Efectuar una representación conjunta de las proyecciones de filas y
# columnas e interpretar los factores y el resultado del análisis.
#
