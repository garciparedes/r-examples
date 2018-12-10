## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 06

rm(list = ls())

observed <- c(442, 38, 514, 6)

(k <- length(observed))
# 4

(n <- sum(observed))
# 1000

EspectedProbabilities <- function(p) {
  c(0.5 * p, 0.5 * (1 - p), 0.5 * p ^ 2 + p * (1 - p), 0.5 * (1 - p) ^ 2)
}

LogLikelihood <- function(p, y) {
  sum(y * log(EspectedProbabilities(p)))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(0.5, NegativeLogLikelihood, y = observed, hessian = TRUE,
             lower = 10e-4, upper = 1 - 10e-4, method = 'L-BFGS-B')

(p.hat <- opt$par)
# 0.912941500560347

expected <- EspectedProbabilities(p.hat) * n

(Q <- sum((observed - expected) ^ 2 / expected))
# 3.08815842598583

(pvalue <- 1 - pchisq(Q, 2))
# 0.213508376478253
