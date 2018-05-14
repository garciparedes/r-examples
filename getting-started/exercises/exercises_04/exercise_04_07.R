#
# Title:
#   Ejercicios Computación Estadística - Hoja 4 - Ejercicio 1
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
path <- "./../../../datasets/"

cifras <- read.table(paste0(path, "cifras_mundiales.txt"), header = TRUE)
summary(cifras)

#
# Apartado b)
#
quantile(cifras$idh, c(0.34, 0.67, 1), na.rm = TRUE)
# 33%
# 0.57035
# 66%
# 0.80694
# 100%
# 0.96

classify <- function(v) {
  if (is.na(v)) {
    NA
  } else if (v <= 0.57035) {
    "Bajo"
  } else if (v <= 0.82172) {
    "Medio"
  } else {
    "Alto"
  }
}

cifras$idh.level <- Vectorize(classify)(cifras$idh)


#
# Apartado c)
#
c <- split(cifras, cifras$idh.level)
write.table(c$Bajo, "cifras-bajo.txt")
write.table(c$Medio, "cifras-medio.txt")
write.table(c$Alto, "cifras-alto.txt")

#
# Apartado d)
#
summary(as.factor(cifras$idh.level))
tapply(cifras$nat, cifras$idh.level, mean, na.rm =TRUE)
tapply(cifras$nat, cifras$idh.level, sd, na.rm =TRUE)

#
# Apartado e)
#
boxplot(nat ~ idh.level, cifras)


#
# Apartado f)
#
pairs(cifras[,1:8])
plot(nat ~ fec, cifras, pch = 20, xlab = "Fecundidad", ylab = "Natalidad",
     main = "Relación entre Fecundidad y Natalidad por paises")
