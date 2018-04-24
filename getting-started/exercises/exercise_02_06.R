#
# Title:
#   Ejercicios Computación Estadística - Hoja 2 - Ejercicio 6
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())

#
# Apartado a)
#
(tomates <- data.frame(bloque = factor(c("B1", "B2", "B3", "B4", "B1", "B2", "B3", "B4", "B1", "B2", "B3", "B4")),
                     variedad = factor(c("V1", "V1", "V1", "V1", "V1", "V2", "V2", "V2", "V2", "V2", "V2", "V2")),
                     produccion = c(8.035, 3.130, 9.355, 7.345, 6.025, 7.250, 3.840, 3.795, 5.335, 7.125, 3.175, 3.280)))
# bloque	variedad	produccion
# B1	V1	8.035
# B2	V1	3.130
# B3	V1	9.355
# B4	V1	7.345
# B1	V1	6.025
# B2	V2	7.250
# B3	V2	3.840
# B4	V2	3.795
# B1	V2	5.335
# B2	V2	7.125
# B3	V2	3.175
# B4	V2	3.280

#
# Apartado b)
#

(b.s <- c("B1", "B2", "B3", "B4")) # 'B1' 'B2' 'B3' 'B4'
(v.s <- c("V1", "V2", "V3")) # 'V1' 'V2' 'V3'

tomates <- cbind(
  expand.grid(rep(b.s, times = 3),
              rep(v.s, times = c(5, 7, 0))),
  c(8.035, 3.130, 9.355, 7.345, 6.025, 7.250, 3.840, 3.795, 5.335, 7.125, 3.175, 3.280))
colnames(tomates) <- c("bloque", "variedad", "produccion")
tomates

#
# Apartado c)
#

tapply(tomates$produccion, tomates$variedad, mean)
# V1
# 6.778
# V2
# 4.82857142857143


#
# Apartado d)
#
(a <- tapply(tomates$produccion, tomates$variedad, summary))
# $V1
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#   3.130   6.025   7.345   6.778   8.035   9.355
#
# $V2
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#   3.175   3.538   3.840   4.829   6.230   7.250
typeof(a) # 'list'

#
# Apartado e)
#
(tomates.splited <- split(tomates, tomates$variedad))
# $V1
# bloque	variedad	produccion
# B1	V1	8.035
# B2	V1	3.130
# B3	V1	9.355
# B4	V1	7.345
# B1	V1	6.025
# $V2
# bloque	variedad	produccion
# 6	B2	V2	7.250
# 7	B3	V2	3.840
# 8	B4	V2	3.795
# 9	B1	V2	5.335
# 10	B2	V2	7.125
# 11	B3	V2	3.175
# 12	B4	V2	3.280

#
# Apartado f)
#

write.table(tomates, file = "tomates.txt")

#
# Apartado g)
#

save(tomates, file = "tomates.R")

#
# Apartado h)
#

# En el primer caso los datos se han guardado en formato de texto plano legible
# por los humanos, mientras que en el segundo caso los datos se guardan en un
# formato más eficiente para su lectura por el ordenador, pero ilegible
# para los humanos
