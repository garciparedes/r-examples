#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 7
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())

d <- matrix(nrow = 4, ncol = 3)

#
# Apartado a)
#

(d[1, 1] <- dpois(6, 7)) # 0.149002779674338
(d[2, 1] <- ppois(12, 7)) # 0.973000226574731
(d[3, 1] <- ppois(8, 7)) # 0.729091267738082
(d[4, 1] <- ppois(5, 7) - ppois(2, 7)) # 0.271072112293839


#
# Apartado b)
#

(d[1, 2] <- dnorm(6, 7, sqrt(7))) # 0.14039124046869
(d[2, 2] <- pnorm(12, 7, sqrt(7))) # 0.970609139322321
(d[3, 2] <- pnorm(8, 7, sqrt(7))) # 0.647271506944363
(d[4, 2] <- pnorm(5, 7, sqrt(7)) - pnorm(2, 7, sqrt(7))) # 0.195455038306766


#
# Apartado c)
#

(d[1, 3] <- dnorm(6 - 0.5, 7, sqrt(7))) # 0.128399614066088
(d[2, 3] <- pnorm(12 + 0.5, 7, sqrt(7))) # 0.981182343106343
(d[3, 3] <- pnorm(8 + 0.5, 7, sqrt(7))) # 0.714624805970913
(d[4, 3] <- pnorm(5 + 0.5, 7, sqrt(7)) - pnorm(2 + 0.5, 7, sqrt(7))) # 0.24088868817818

#
# Apartado d)
#

colnames(d) <- c("Exacto", "Normal", "Normal Corregida")
rownames(d) <- c("P(X = 6)", "P(X <= 12)", "P(X <= 8)", "P( 2<= X <= 5)")
d


#
# Apartado e)
#
x <- seq(0, 20, length = 100)
plot(round(x), dpois(round(x), 7))
lines(x, dnorm(x, 7, sqrt(7)), col = "red")
lines(x, dnorm(x - 0.5, 7, sqrt(7)), col = "blue")
