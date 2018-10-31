#
# Title:
#   Modelos Estadístico Avanzados - Introducción
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   September 2018
#

rm(list = ls())

# Data Values
y <- c( 47, 97, 123, 152, 191, 200, 76, 107, 139, 159, 201, 207 )

naiveModel <- lm(y ~ 1)
# Mean Confidence Intervals
confint(naiveModel, level = 0.95, methods = c("Wald"))

# Normality testing

## Kolmogorov-Smirnov test
ks.test(y, pnorm)

## Shaphiro-Wilks test
shapiro.test(y)


# Normality plot
qqnorm(y)
qqline(y)

# Más Datos

G <- as.factor( rep(c(0,1), 6) ) 
g <- as.numeric( G )  # numérica con valores 1,2
data.frame(G, g, y)  # comprobar que esto es distinto de cbind(G, g, y)

## comparación de medias de ambos grupos


## Test F de igualdad de varianzas


## Realizar el siguiente gráfico


# Otra variable explicativa

xx <- c( 1, 3.5, 3.1, 5.5, 5.1, 7, 1.8, 4.2, 4, 6, 5.6, 8 )


## Regresión con dos variables

xx2 <- xx^2


## Variable numérica + factor


