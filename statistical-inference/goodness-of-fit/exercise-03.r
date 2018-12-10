## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 01

rm(list = ls())

observed <- c(6, 18, 32, 35, 17, 10, 2)

(k <- length(observed))
# 7

(n <- sum(observed))
# 120

LogLikelihood <- function(lamdba, y, k) {
  (sum(y[1:(k - 1)] * dpois(0:(k - 2), lambda = lamdba, log = TRUE)) +
    y[k] * ppois(k - 2, lambda = lamdba, log = TRUE, lower.tail = FALSE))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(1, NegativeLogLikelihood, lower = 10e-4, y = observed, k = k,
             method = "L-BFGS-B")

(lambda.hat <- opt$par)
# 2.65019719097978

(expected <- n * c(dpois(0:(k - 2), lambda = lambda.hat),
                   1 - ppois(k - 1, lambda = lambda.hat)))
# 8.47647391824289 22.4643273675407 29.7674486433533 26.2965362590832 ...

(Q <- sum((observed - expected) ^ 2 / expected))
# 4.76208557778011

(pvalue <- 1 - pchisq(Q, df = (k - 1) - 1))
# 0.445600066398024
