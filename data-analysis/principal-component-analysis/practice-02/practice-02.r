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
rownames(A) <- DATA[,12]

#
# Efectuar mediante un ACP normado con los datos de las 10 pruebas.
#


X <- t((t(A) - colMeans(A)) / apply(A, 2, sd))
X_n <- dim(X)[1]
X_p <- dim(X)[2]

X_star <- (t(X) %*% X) / (X_n-1)

X_eig <- eigen(X_star)
X_lambda <- X_eig$values
X_u <- X_eig$vectors

#
# Calcular los scores en las 10 componentes y comprobar que tienen media 0
# y varianza igual al autovalor correspondiente.
#


F <- X %*% X_u

ggplot(as.data.frame.matrix(F), aes(x=V1, y=V2)) +
  geom_point() +
  geom_text(label=rownames(F))


0 == round(colMeans(F), digits=4)
round(X_lambda, digits=4) == round(apply(F, 2, sd) ^ 2, digits=4)
sum(X_lambda)

#
# Calcular las contribuciones absolutas y relativas de los puntos a las
# componentes y hacer la representación gráfica correspondiente.
#


X_ca <- t(t(F^2) / rowSums(t(F ^ 2)))
X_re <- (F^2) / rowSums(F ^ 2)

print(round(X_ca, digits = 4))
print(round(X_re, digits = 4))

#
# Considerar ahora la nube de los puntos columna y calcular los autovalores y
# autovectores correspondientes. Comprobar las relaciones con los resultados
# de la nube de puntos fila.
#

X_v <- t(t(F) / (sqrt(X_lambda * (X_n - 1))))


print(round(X_v, digits = 4))

G <- t(X) %*% X_v

print(G)

X_u_2 <- t(t(G) / sqrt(X_lambda * (X_n - 1)))


round(X_u_2, digits = 4) == round(X_u, digits = 4)


ggplot(as.data.frame.matrix(G), aes(x=V1, y=V2)) +
  geom_point() +
  geom_text(label=rownames(G))

#
# Calcular las proyecciones de las variables (scores) en los nuevos ejes.
# Calcular sus medias, sus varianzas y la suma de sus cuadrados (dividida por n-1).
#

colMeans(G)
apply(G, 2, sd) ^ 2

#
# Reconstruir la matriz de datos original a partir de los autovalores y autovectores.
#

#
# Reconstruir la matriz con las dos primeras componentes principales y valorar la pérdida.
#
