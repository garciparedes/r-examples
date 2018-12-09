rm(list = ls())

y <- c(442, 38, 514, 6)
n <- 1000

EspectedProbabilities <- function(p) {
  c(0.5 * p, 0.5 * (1 - p), 0.5 * p ^ 2 + p * (1 - p), 0.5 * (1 - p) ^ 2)
}


LogLikelihood <- function(p, y) {
  sum(y * log(EspectedProbabilities(p)))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(0.5, NegativeLogLikelihood, y = y, hessian = TRUE,
             lower = 10e-4, upper = 1 - 10e-4, method = 'L-BFGS-B')

p.hat <- opt$par


e <- EspectedProbabilities(p.hat) * n
Q <- sum((y - e) ^ 2 / e)
(pvalue <- 1 - pchisq(Q, 2))
