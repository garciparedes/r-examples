#
# Title:
#   Ejercicios Computación Estadística - Hoja 6 - Ejercicio 2
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#


my.mean <- function(x, with.arithmetic = TRUE, k = 0,
                    with.cropped = TRUE,
                    with.winsorize = TRUE,
                    with.geometric = TRUE,
                    with.armonic = TRUE,
                    with.cuadratic = TRUE, ...) {
  result <- list()
  n <- length(x)

  if (with.arithmetic) {
    result$arithmetic <- mean(x, ...)
  }
  if (with.cropped) {
    result$cropped <- mean(x[(k + 1):(n - k)], ...)
  }

  if (with.winsorize) {
    result$winsorize <- ((k + 1) * x[k + 1] + sum(x[(k + 2):(n - k - 1)], ...) +
                          (k + 1) * x[n - k]) / n
  }

  if (with.geometric) {
    result$geometric <- prod(x, ...) ^ (1 / n)
  }

  if (with.armonic) {
    result$armonic <- 1 / (sum(1 / x, ...) / n)
  }

  if (with.cuadratic) {
    result$cuadratic <- sqrt(mean(x ^ 2, ...))
  }

  return(result)
}

my.mean((1:100), k = 3)
