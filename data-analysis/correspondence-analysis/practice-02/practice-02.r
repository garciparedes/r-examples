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

DATA <- read.csv('./../../../datasets/salud-by-edad.csv', header=TRUE)
print(DATA)

N = DATA[,2:6]
print(N)


#
# 2) Revisar el test chi-cuadrado, su interpretación, las tablas que llevan a
#   la generación de sus valores y los perfiles fila y columna
#



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
