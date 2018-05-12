#
# Title:
#   Ejercicios Computación Estadística - Hoja 6 - Ejercicio 4
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

#
# Apartado a)
#

simu.1 <- function() {
  m <- 250
  n <- 20
  mu <- 10
  sigma <- 2
  s <- matrix(rnorm(m * n, mu, sigma), ncol = n, nrow = 250)
  result <- list()
  r <- rowMeans(s)
  result$means <- hist(r)
  result$meanmean <-  mean(r)
  return(result)
}

simu.1()

#
# Apartado b)
#

simu.2 <- function(m = 250, n = 20, mu = 10, sigma = 2) {
  s <- matrix(rnorm(m * n, mu, sigma), ncol = n, nrow = 250)
  result <- list()
  r <- rowMeans(s)
  result$means <- hist(r)
  result$meanmean <- mean(r)
  return(result)
}

simu.2()

#
# Apartado c)
#

simu.3 <- function(m = 250, n = 20, mu = 10, sigma = 2, f = mean) {
  s <- matrix(rnorm(m * n, mu, sigma), ncol = n, nrow = 250)
  result <- list()
  r <- apply(s, 1, f)
  result$means <- hist(r, )
  result$meanmean <- mean(r)
  return(result)
}

simu.3()

par(mfrow = c(2, 3))
n.vector <- c(10, 40, 100)
f.vector <- c(mean, median)
for (f in f.vector) {
  for (n in n.vector) {
    simu.3(n = n,f = f)$means
  }
}
