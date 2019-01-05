## Author: Sergio García Prado

rm(list = ls())


## a)
####

## Asymptotic distibution of (lambda1.hat, lambda2.hat) as parameters lambda1 of Pois(lambda1) and
## lambda2 of Pois(lambda2) independent of each other.
##
## (lambda1.hat, lambda2.hat) ~ N_2( (lambda1, lambda2) , [lambda1 / n, 0;
##                                                         0, lambda2 / n] )
##


## b)
####
n1 <- 50
y1 <- 75

n2 <- 50
y2 <- 100

n <- c(n1, n2)
y <- c(y1, y2)

alpha <- 0.05

LogLikelihood <- function(lambda, y, n) {
  sum(y * log(lambda) - n * lambda)
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(runif(2), NegativeLogLikelihood, y = y, n = n, hessian = TRUE)

(lambda.hat <- opt$par)
#

(lambda.hat.var <- solve(opt$hessian))
#
#

g.transform <- c(-2, 1)

(g.hat <- (g.transform %*% lambda.hat)[1])
#

(g.hat.var <- (g.transform %*% lambda.hat.var %*% g.transform)[1])
#

## Wald's Confidence Interval at (1 - alpha)% level.
g.hat + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(g.hat.var)
#


## b)
####
g.zero <- 0

(W <- (g.hat - g.zero) ^ 2 / g.hat.var)
#

(W.pvalue <- 1 - pchisq(W, df = 1))
#

## b)
####

LogLikelihoodHZero <- function(ll, ...) {
  LogLikelihood(c(2 * ll, ll), ...)
}

NegativeLogLikelihoodHZero <- function(...) {
  - LogLikelihoodHZero(...)
}

opt.hzero <- optim(runif(1), NegativeLogLikelihoodHZero, y = y, n = n,
                   lower = 10e-3, upper = 10e3, method = "Brent")

(LRT <- 2 * (LogLikelihood(lambda.hat, y, n) - LogLikelihoodHZero(opt.hzero$par, y, n)))
#

(LRT.pvalue <- 1 - pchisq(LRT, df = 1))
#
