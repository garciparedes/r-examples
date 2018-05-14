#
# Title:
#   Ejercicios Computación Estadística - Hoja 2 - Ejercicio 4
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())



A <- t(matrix(c(1, 2, 3,
                2, 3, 1,
                3, 1, 2,
                1, 2, 3), nrow = 3))
A <- cbind(c(1, 2, 3, 1),
            c(2, 3, 1, 2),
            c(3, 1, 2, 3))
A <- rbind(c(1, 2, 3),
           c(2, 3, 1),
           c(3, 1, 2),
           c(1, 2, 3))

#
# Apartado a)
#
colnames(A) <- c("C1", "C2", "C3")
rownames(A) <- c("F1", "F2", "F3", "F4")
A
# C1	C2	C3
# F1	1	2	3
# F2	2	3	1
# F3	3	1	2
# F4	1	2	3

#
# Apartado b)
#
A[1:2, 1:2]
#    C1	C2
# F1	1	2
# F2	2	3

#
# Apartado c)
#
A[, 3, drop = FALSE]
#     C3
# F1	3
# F2	1
# F3	2
# F4	3

#
# Apartado d)
#
A[A > 2] <- - A[A > 2]
A
# C1	C2	C3
# F1	1	2	-3
# F2	2	-3	1
# F3	-3	1	2
# F4	1	2	-3
