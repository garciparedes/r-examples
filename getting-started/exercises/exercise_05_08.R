#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 8
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())

mu <- 11.2
sigma <- 2.5

#
# Apartado a)
#
qnorm(0.3, mu, sigma) #9.8889987182299


#
# Apartado b)
#


b <- pnorm(12.4, mu, sigma) - pnorm(10, mu, sigma) # 0.368772606967555

#
# Apartado c)
#

n <- 4
c <- pnorm(12.4, mu, sigma / sqrt(n)) - pnorm(10, mu, sigma / sqrt(n)) # 0.662944785066324

#
# Apartado d)
#


n <- 16
d <- pnorm(12.4, mu, sigma / sqrt(n)) - pnorm(10, mu, sigma / sqrt(n)) # 0.945142100592326

#
# Apartado e)
#

barplot(c(b, c, d), col = 2:4, ylab = "p(x)", main = "P(10 <= X_raya <= 12.4) (variando n)")
legend("topleft",
       legend = c("n = 1", "n = 4", "n = 16"),
       fill = 2:4)
