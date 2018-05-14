#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 5
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

pchisq(8, 10) # 0.371163064820127
pchisq(10, 10, lower.tail = FALSE) # 0.440493285065212
pchisq(15, 10) - pchisq(10, 10) # 0.308431428777492


#
# Apartado b)
#
q <- c(0.25, 0.5, 0.75)
qchisq(q, 10) # 6.73720077195464 9.34181776559197 12.5488613968894
all.equal(pchisq(qchisq(q, 10), 10), q) # TRUE


#
# Apartado c)
#
x <- seq(0, 30, length = 200)
plot(x, pchisq(x, 10), type = "l")
abline(h = q, lty = 20)
abline(v = qchisq(q, 10), lty = 20)
