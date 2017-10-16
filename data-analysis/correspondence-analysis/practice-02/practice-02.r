#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Correspondence Analyis - Práctica 02
#
#

rm(list = ls())

DATA <- read.csv('./../../../datasets/salud-by-edad.csv', header=TRUE)
print(DATA)

N = DATA[,2:6]
print(N)
