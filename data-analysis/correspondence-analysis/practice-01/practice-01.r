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

Dr <- diag(rowSums(F))
Dc <- diag(colSums(F))
print(Dr)
print(Dc)

p_row <- solve(Dr) %*% F
p_col <- solve(Dc) %*% t(F)
print(p_row)
print(p_col)


# 3. Calcular las distancias chi cuadrado entre los tres puntos fila
d_chi_square <- function(x, y) t(x - y) %*% solve(Dc) %*% (x - y)
D <- c(
  d_chi_square(F[,1],F[,2]),
  d_chi_square(F[,1],F[,3]),
  d_chi_square(F[,2],F[,3])
)
print(D)

d_chi_square_2 <- function(x, y) sum(1 / colSums(F) * (x / rowSums(F) - y / rowSums(F))^2)
D2 <- c(
  d_chi_square_2(F[,1],F[,2]),
  d_chi_square_2(F[,1],F[,3]),
  d_chi_square_2(F[,2],F[,3])
)
print(D2)

# 4. Calcular el valor del estadístico chi cuadrado
chi_value <- sum(
  (N - (rowSums(N) %*% t(colSums(N))) / sum(N)) ^ 2 /
  ((rowSums(N) %*% t(colSums(N))) / sum(N))
)
chisq.test(N)

# 5. Calcular la inercia total como la suma ponderada de las distancias chi
# cuadrado al centro de gravedad de los puntos fila y comprobar que es el
# estadístico chi cuadrado dividido por n

# TODO
# sum(p_row * d_chi_square_2(F,colSums(F))) / sum(N)

# 6. Construir la matriz a diagonalizar, diagonalizarla calculando los
# autovalores y autovectores unitarios

X <- t(F) %*% solve(Dr) %*% F %*% solve(Dc)
print(X)
X_eigen <- eigen(X)

print(X_eigen$values)
print(X_eigen$vectors)

U <- (X_eigen$vectors / norm(X_eigen$vectors))
print(U)
# 7. Calcular los factores y las proyecciones de los puntos fila sobre los ejes

proyecciones <- (solve(Dr) %*% F) %*% solve(Dc) %*% U
print(proyecciones)
# 8. Calcular las distancias euclídeas entre las proyecciones y compararlas con
# las del punto 3
d_euclidean <- function(x, y) sum( (x / rowSums(F) - y / rowSums(F))^2)
print(d_euclidean(F[,2], F[,3]))
print(d_chi_square_2(F[,2], F[,3]))

# 9. Calcular los factores y las proyecciones de los puntos columna sobre los
# ejes


# 10. Efectuar una representación conjunta de las proyecciones de filas y
# columnas
