#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Componentes Principales - Práctica 01
#
#


# 1.	Construir la matriz

N <- t(matrix(
  c(20,20,20,
    40,10,40,
    20,10,40),
  ncol=3
))
print(N)


# 2.	Construir las matrices F, Dr, Dc y las matrices de puntos fila y columna.

F <- N / sum(N)
print(F)

Dr <- diag(rowSums(N) / sum(N))
Dc <- diag(colSums(N) / sum(N))
print(Dr)
print(Dc)

Pr <- solve(Dr) %*% F
Pc <- solve(Dc) %*% t(F)
print(Pr)
print(Pc)


# 3. Calcular las distancias chi cuadrado entre los tres puntos fila

d_chi_square <- function(x, y) t(x - y) %*% solve(Dc) %*% (x - y)
D <- c(
  d_chi_square(Pr[1,],Pr[2,]),
  d_chi_square(Pr[1,],Pr[3,]),
  d_chi_square(Pr[2,],Pr[3,])
)
print(D)


# 4. Calcular el valor del estadístico chi cuadrado

chi_value <- sum(
  (N - (rowSums(N) %*% t(colSums(N))) / sum(N)) ^ 2 /
  ((rowSums(N) %*% t(colSums(N))) / sum(N))
)
print(chi_value)

pval <- pchisq(chi_value, df=4, lower.tail=FALSE)
print(pval)

# 5. Calcular la inercia total como la suma ponderada de las distancias chi
# cuadrado al centro de gravedad de los puntos fila y comprobar que es el
# estadístico chi cuadrado dividido por n

Gc <- colSums(N) / sum(N)
Gr <- rowSums(N) / sum(N)
print(Gc)
print(Gr)

diag(t(t(Pr) - Gc) %*% solve(dc) %*% t(t(t(Pr)-Gc))) %*% Gr
G <- (diag(t(t(Pr) - Gc) %*% solve(dc) %*% t(t(t(Pr)-Gc))) %*% Gr)[1,1]
print(G)


# 6. Construir la matriz a diagonalizar, diagonalizarla calculando los
# autovalores y autovectores unitarios

X <- t(F) %*% solve(Dr) %*% F %*% solve(Dc)
print(X)
X_eigenvec <- eigen(X)$vectors
X_eigenval <- eigen(X)$values

print(X_eigenval)
print(X_eigenvec)

# 7. Calcular los factores y las proyecciones de los puntos fila sobre los ejes


fact <- solve(Dc) %*% X_eigenvec
print(fact)

Proyec_r <- Pr %*% fact
print(Proyec_r)


# 8. Calcular las distancias euclídeas entre las proyecciones y compararlas con
# las del punto 3

d_euclidean <- function(x, y) sum( (x / rowSums(F) - y / rowSums(F))^2)
print(d_euclidean(F[,2], F[,3]))
print(d_chi_square(F[,2], F[,3]))


# 9. Calcular los factores y las proyecciones de los puntos columna sobre los
# ejes


# 10. Efectuar una representación conjunta de las proyecciones de filas y
# columnas

Proyec_r_dataframe <- as.data.frame(Proyec_r[,2:3])
rownames(Proyec_r_dataframe)<-c("J","ME","M")
Proyec_r_dataframe

library(ggplot2)
ggplot(data = Proyec_r_dataframe, aes(x = V1, y = V2, label=rownames(Proyec_r_dataframe))) +
  geom_text(colour = "red", size = 6) +
  ggtitle("Proyección simultánea")
