#
# Title:
#   Ejercicios Computación Estadística - Hoja 6 - Ejercicio 3
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

Chi2NormalQuantileApproximation <- function(p, n) {
  return(0.5 * (qnorm(p) + sqrt(2 * n - 1)) ^ 2)
}


p.vector <- c(0.01, 0.1, 0.25, 0.50, 0.75, 0.9, 0.99)
n.vector <- c(3, 9, 24)

t <-
  lapply(n.vector, function(n) {
    v <- cbind(qchisq(p.vector, n), Chi2NormalQuantileApproximation(p.vector, n))
    colnames(v) <- c("Exact", "Approx.")
    rownames(v) <- paste0("p", p.vector)
    return(as.table(v))
  })
names(t) <- paste0("n", n.vector)
t
