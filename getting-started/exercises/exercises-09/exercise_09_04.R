#
# Title:
#   Ejercicios Computación Estadística - Hoja 9 - Ejercicio 4
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

rm(list = ls())


Tipify <- function(sample.mean, mu, dev, n) {
  (sample.mean - mu) * sqrt(n) / dev
}


Simulate <- function(B, n, Generator, GeneratorMu, GeneratorSd, ...) {
  s <- matrix(Generator(B * n, ...),
                     nrow = B, ncol = n)

  mu <- GeneratorMu(...)
  dev <- GeneratorSd(...)

  s.means <- rowMeans(s)
  s.means.tipified <- Tipify(s.means, mu, dev, n)

  hist(s.means.tipified, prob = TRUE, breaks = sqrt(B), cex.main = 0.85,
       main = paste("Histograma de la media de ", B,
                    "medias muestrales de tamaño", n,
                    "tipificadas. \n X_raya:",
                    round(mean(s.means.tipified), digits = 4),
                    "  S_x:", round(sd(s.means.tipified), digits = 4)))
  curve(dnorm(x), add = TRUE)
}

NormalMu <- function(...) {
  list(...)$mean
}

NormalSd <- function(...) {
  list(...)$sd
}

BinomMu <- function(...) {
  l <- list(...)
  l$size * l$prob
}

BinomSd <- function(...) {
  l <- list(...)
  sqrt(l$size * l$prob * (1 - l$prob))
}

WeibullMu <- function(...) {
  l <- list(...)
  l$scale * gamma (1 + 1 / l$shape)
}

WeibullSd <- function(...) {
  l <- list(...)
  sqrt(l$scale ^ 2 * ( gamma(1 + 2 / l$shape) - gamma(1 + 1 / l$shape) ^ 2 ))
}

Simulate(200, 20, rbinom, BinomMu, BinomSd, size = 20, prob = 0.03)
Simulate(200, 20, rbinom, BinomMu, BinomSd, size = 20, prob = 0.8)
Simulate(200, 20, rnorm, NormalMu, NormalSd, mean = 20, sd = 2)
Simulate(200, 20, rweibull, WeibullMu, WeibullSd, shape = 15, scale = 5)
