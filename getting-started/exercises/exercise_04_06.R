#
# Title:
#   Ejercicios Computación Estadística - Hoja 4 - Ejercicio 6
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())


library(MASS)
data(Animals)

#
# Apartado a)
#
summary(Animals)


#
# Apartado b)
#
Animals[Animals$brain == max(Animals$brain),]


#
# Apartado c)
#

Animals$brain[Animals$body > mean(Animals$body)]


#
# Apartado d)
#

hist(Animals$brain)
hist(Animals$body)

#
# Apartado e)
#

par(mfrow=c(1,2))
boxplot(Animals$brain, pch = 20, outline = FALSE)
boxplot(Animals$body, pch = 20, outline = FALSE)
#
# Apartado f)
#

par(mfrow=c(1,2))
plot(Animals$brain, Animals$body, xlab = "Peso del Cerebro", ylab = "Peso del Cuerpo", pch = 20)
plot(log(Animals$brain), log(Animals$body), xlab = "Peso del Cerebro", ylab = "Peso del Cuerpo", pch = 20)
