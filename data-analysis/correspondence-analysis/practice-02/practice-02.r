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

#
# 1) Importar los datos a R desde el fichero salud by edad.csv
#

N <- data.matrix(read.csv(
  './../../../datasets/salud-by-edad.csv',
  header=TRUE,
  row.names = 1))
print(N)

F <- N / sum(N)
print(F)


D_r <- diag(rowSums(N) / sum(N))
D_c <- diag(colSums(N) / sum(N))

print(D_r)
print(D_c)

P_r <- solve(D_r) %*% F
P_c <- solve(D_c) %*% t(F)

print(P_r)
print(P_c)

#
# 2) Revisar el test chi-cuadrado, su interpretación, las tablas que llevan a
#   la generación de sus valores y los perfiles fila y columna
#

d_chi_square <- function(x, y) (t(x - y) %*% solve(D_c) %*% (x - y))[1,1]
D <- c(
  d_chi_square(P_r[1,],P_r[2,]),
  d_chi_square(P_r[1,],P_r[3,]),
  d_chi_square(P_r[2,],P_r[3,])
)
print(D)

chi_value <- sum(
  (N - (rowSums(N) %*% t(colSums(N))) / sum(N)) ^ 2 /
  ((rowSums(N) %*% t(colSums(N))) / sum(N))
)
print(chi_value)

pval <- pchisq(chi_value,
  df=(dim(N)[1] - 1) * (dim(N)[2] - 2), lower.tail=FALSE)
print(pval)

#
# 3) Tomar decisiones sobre el número de componentes a extraer basadas en los
#   autovalores. ¿Cuántos autovalores hay en este análisis?
#



#
# 4) Inspeccionar las tablas de coordenadas de filas y columnas. ¿Dónde aparece
#   la calidad de la representación de los puntos sobre el plano definido por
#   los dos primeros factores? ¿Cuánto vale esa calidad para la observación
#   correspondiente a los individuos entre 45 y 54 años?
#



#
# 5) Buscar posibles puntos de influencia en alguno de los dos primeros
#   factores. Rehacer el análisis si es necesario e interpretar el primer
#   plano factorial
#



#
# 6) Efectuar una representación conjunta de las proyecciones de filas y
#   columnas e interpretar los factores y el resultado del análisis
#



#
# 7) ¿Puede decirse, a la vista del gráfico, que entre los individuos entre 16
#   y 24 años predomina la percepción de salud propia como MB? ¿Puede decirse,
#   a la vista del gráfico, que entre los de percepción de salud M predominan
#   los individuos de 75 o más años? Revisar los perfiles fila y perfiles
#   columna.
#
