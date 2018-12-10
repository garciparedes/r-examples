## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 11


rm(list = ls())

observed <- c(23, 18, 12, 7)

(k <- length(observed))
# 4

(n <- sum(observed))
# 60

LogLikelihood <- function(p, y) {
  (sum(y[1:(k - 1)] * dgeom(0:(k - 2), prob = p, log = TRUE)) +
     y[k] * pgeom(k - 2, prob = p, lower.tail = TRUE))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(0.5, NegativeLogLikelihood, y = observed,
             lower = 10e-4, upper = 1 - 10e-4, method = "L-BFGS-B")

(p.hat <- opt$par)
# 0.568016367320236

## a)

(expected <- n * c(dgeom(0:(k - 2), prob = p.hat), 1 - pgeom(k - 2, prob = p.hat)))
# 34.0809820392142 14.7224264265935 6.35984724962043 4.83674428457189

(Q <- sum((observed - expected) ^ 2 / expected))
# 10.3019299508017

(pvalue <- 1 - pchisq(Q, df = (k - 1) - 1))
# 0.00579381114321054

## b)

alpha <- 0.05

(criticvalue <- qchisq(1 - alpha, df = k - 1))
# 7.81472790325118

(alternative <- n * c(dnbinom(0:(k - 2), size = 2, prob = 0.6), 1 - pnbinom(k - 2, size = 2, prob = 0.4)))
# 21.6 17.28 10.368 28.512

(null <- n * c(dgeom(0:(k - 2), prob = 0.4), 1 - pgeom(k - 2, prob = 0.4)))
# 24 14.4 8.64 12.96

(Q <- sum((alternative - null) ^ 2 / null ))
# 19.824

(power <- 1 - pchisq(criticvalue, df = k - 1, ncp = Q))
# 0.973940021807995


## c)

fn <- function(n) {
  alternative <- n * c(dnbinom(0:(k - 2), size = 2, prob = 0.6), 1 - pnbinom(k - 2, size = 2, prob = 0.4))
  null <- n * c(dgeom(0:(k - 2), prob = 0.4), 1 - pgeom(k - 2, prob = 0.4))

  Q <- sum((alternative - null) ^ 2 / null )
  power <- 1 - pchisq(qchisq(1 - alpha, df = k - 1), df = k - 1, ncp = Q)

  return(power)
}

(n.exact <- uniroot(function(n){ fn(n) - 0.7 }, c(1, 100))$root)
# 26.6113581747679

ceiling(n.exact)
# 27
