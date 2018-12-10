## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 04

rm(list = ls())


observed <- c(181, 9, 4, 10, 7, 4, 5)

(k <- length(observed))
# 7

(n <- sum(observed))
# 220

LogLikelihood <- function(lambda, y, k) {
  sum(y[1:(k - 1)] * dpois(0:(k - 2), lambda = lambda, log = TRUE)) +
    y[k] * ppois(k - 2, lambda = lambda, log = TRUE, lower.tail = FALSE)
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(1, NegativeLogLikelihood, y = observed, k = k,
             lower = 10e-4, method = "L-BFGS-B")

(lambda.hat <- opt$par)
# 0.570151904892779

(expected <- n * c(dpois(0:(k - 2), lambda = lambda.hat),
                   1 - ppois(k - 1, lambda = lambda.hat)))
# 124.396698611428 70.9250146756785 20.2190161109432 3.84263685023735 ...

(Q <- sum((observed - expected) ^ 2 / expected))
# 48477.9741227136

(pvalue <- 1 - pchisq(Q, df = (k - 1) - 1))
# 0
