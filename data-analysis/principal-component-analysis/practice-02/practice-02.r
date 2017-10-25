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
library(MASS)

#
# 1)
# Importar los datos a SAS desde el fichero Olympic2016 v2.txt;
#

DATA <- read.csv('./../../../datasets/olympic-2016-v2.txt', header=TRUE)

A <- DATA[,1:10]
rownames(A) <- DATA[,12]

#
# 2)
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
# 3)
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
# 4)
# Calcular las contribuciones absolutas y relativas de los puntos a las
# componentes y hacer la representación gráfica correspondiente.
#


X_ca <- t(t(F^2) / rowSums(t(F ^ 2)))
X_re <- (F^2) / rowSums(F ^ 2)

print(round(X_ca, digits = 4))
print(round(X_re, digits = 4))

#
# 5)
# Considerar ahora la nube de los puntos columna y calcular los autovalores y
# autovectores correspondientes. Comprobar las relaciones con los resultados
# de la nube de puntos fila.
#

X_v <- t(t(F) / sqrt(X_lambda * (X_n - 1)))

print(round(X_v, digits = 4))

G <- t(X) %*% X_v

print(G)

X_u_2 <- t(t(G) / sqrt(X_lambda * (X_n - 1)))


round(X_u_2, digits = 4) == round(X_u, digits = 4)


ggplot(as.data.frame.matrix(G), aes(x=V1, y=V2)) +
  geom_point() +
  geom_text(label=rownames(G))

#
# 6)
# Calcular las proyecciones de las variables (scores) en los nuevos ejes.
# Calcular sus medias, sus varianzas y la suma de sus cuadrados (dividida por n-1).
#

# Medias (nada)
round(colMeans(G), digits=4)

# Varianzas (Nada)
round(apply(G, 2, sd) ^ 2, digits=4)

# Suma de cuadrados dividida entre n-1 (lambdas o autovalores)
round(colSums(G^2)/(X_n -1), digits=4)

#
# 7)
# Reconstruir la matriz de datos original a partir de los autovalores y
# autovectores.
#

# Reconstrucción de la matriz de covarianzas
X_u %*% diag(X_lambda) %*% ginv(X_u)

# Reconstrucción de la matriz de datos
X
(X_v %*% diag(sqrt(X_lambda  * (X_n -1))) %*% t(X_u))

#
# 8)
# Reconstruir la matriz con las dos primeras componentes principales y valorar
# la pérdida.
#

# Ratio de distorsión por la reducción de dimensiones
1-sum(X_lambda[1:2]) / sum(X_lambda)

# Reconstrucción de la matriz de covarianzas
X_u[,1:2] %*% diag(X_lambda[1:2]) %*% ginv(X_u[,1:2])

# Reconstrucción de la matriz de datos
X_v[,1:2] %*% diag(sqrt(X_lambda[1:2] * (X_n -1))) %*% t(X_u[,1:2])
