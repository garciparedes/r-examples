#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Análisis de Componentes Principales - Práctica 02
#
#

rm(list = ls())

library(ggplot2)

# Importar los datos a SAS desde el fichero Olympic2016 v2.txt;

DATA <- read.csv('./../../../datasets/olympic-2016-v2.txt', header=TRUE)

A <- DATA[,1:10]


#
# Efectuar mediante un ACP normado con los datos de las 10 pruebas.
#


X <- t((t(A) - colMeans(A)) / apply(A, 2, sd))

X_star = (t(X) %*% X) / (dim(X)[1]-1)

X_eig <- eigen(X_star)
X_lambda <- X_eig$values
X_u <- X_eig$vectors

#
# Calcular los scores en las 10 componentes y comprobar que tienen media 0
# y varianza igual al autovalor correspondiente.
#


X_scores <- X %*% X_u

0 == round(colMeans(X_scores), digits = -4)
round(X_lambda, digits = -4) == round(apply(X_scores, 2, sd) ^ 2, digits = -4)


#
# Calcular las contribuciones absolutas y relativas de los puntos a las
# componentes y hacer la representación gráfica correspondiente.
#



#
# Considerar ahora la nube de los puntos columna y calcular los autovalores y
# autovectores correspondientes. Comprobar las relaciones con los resultados
# de la nube de puntos fila.
#


#
# Calcular las proyecciones de las variables (scores) en los nuevos ejes.
# Calcular sus medias, sus varianzas y la suma de sus cuadrados (dividida por n-1).
#

#
# Reconstruir la matriz de datos original a partir de los autovalores y autovectores.
#

#
# Reconstruir la matriz con las dos primeras componentes principales y valorar la pérdida.
#
