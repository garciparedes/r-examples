## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 14


rm(list = ls())

observed <- c(9, 11, 4, 6)

(k <- length(observed))
# 4

(n <- sum(observed))
# 30

## test F(x) is poisson(lambda)

LogLikelihood <- function(lambda, y, k) {
  (sum(y[1:(k - 1)] * dpois(0:(k - 2), lambda = lambda, log = TRUE)) +
    y[k] * ppois(k - 2, lambda = lambda, lower.tail = FALSE, log = TRUE))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(1, NegativeLogLikelihood, y = observed, k = k,
             lower = 10e-4, method = 'L-BFGS-B')

(lambda.hat <- opt$par)
# 1.31334181246836

(expected1 <- n * c(dpois(0:(k-2), lambda = lambda.hat), 1 - ppois(k - 2, lambda = lambda.hat)))
# 8.06759619945891 10.5955114148602 6.9577640828109 4.37912830286995

(Q1 <- sum((observed - expected1) ^ 2 / expected1))
# 1.98049899014501

1 - pchisq(Q1, df = (k - 1) - 1)
# 0.371483996032531

## test F(x) is poisson(1.2)
(expected2 <- n * c(dpois(0:(k-2), lambda = 1.2), 1 - ppois(k - 2, lambda = 1.2)))
# 9.03582635736606 10.8429916288393 6.50579497730357 3.61538703649109

(Q2 <- sum((observed - expected2) ^ 2 / expected2))
# 2.54038357961436

1 - pchisq(Q2, df = (k - 1))
# 0.468037053437737

## power:

(null <- n * c(dpois(0:(k-2), lambda = 1.2), 1 - ppois(k - 2, lambda = 1.2)))
# 9.03582635736606 10.8429916288393 6.50579497730357 3.61538703649109

(alternative <- n * c(dnbinom(0:(k-2),size = 2, prob = 2 / 3), 1 - pnbinom(k - 2,size = 2, prob = 2 / 3)))
# 13.3333333333333 8.88888888888889 4.44444444444445 3.33333333333333

(Q <- sum((alternative - null) ^ 2 / alternative))
# 2.79465432822941


(power <- 1 - pchisq(qchisq(0.95, df = k - 1), df = k - 1, Q))
# 0.257468163480735

## sample size power >= 0.8

fn <- function(n) {
  null <- n * c(dpois(0:(k-2), lambda = 1.2), 1 - ppois(k - 2, lambda = 1.2))
  alternative <- n * c(dnbinom(0:(k-2),size = 2, prob = 2 / 3), 1 - pnbinom(k - 2,size = 2, prob = 2 / 3))

  Q <- sum((alternative - null) ^ 2 / alternative)
  power <- 1 - pchisq(qchisq(0.95, df = k - 1), df = k - 1, Q)
}


(n.exact <- uniroot(function(n) {fn(n) - 0.8}, c(1, 500))$root)
# 117.036620884611

ceiling(n.exact)
# 118
