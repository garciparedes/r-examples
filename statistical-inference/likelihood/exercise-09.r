## Author: Sergio García Prado

rm(list = ls())

y <- c(1997, 904, 906)
k <- length(y) + 1
n <- 3839


## a)
####

LogLikelihood <- function(p, y, n) {
  sum(y * log(p)) + (n - sum(y)) * log(1 - sum(p))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(rep(1 / k, k - 1), NegativeLogLikelihood, y = y, n = n,
             hessian = TRUE)
p.hat <- opt$par
p.hat.var <- solve(opt$hessian)

g.function <- function(p) {
  c(4 * p[1] + 4 * p[2] - 3,
    p[2] - p[3])
}

g.derivative <- function(p) {
  matrix(c(4,  4,  0,
           0,  1, -1),
         2, 3, byrow = TRUE)
}

g.zero <- rep(0, 2)

## Sandwitch Estimator.
(W <- (g.function(p.hat) - g.zero) %*% g.derivative(p.hat) %*% p.hat.var %*% t(g.derivative(p.hat)) %*% (g.function(p.hat) - g.zero))
# 3.809448e-07

(W.pvalue <- 1 - pchisq(W, df = 2))
# 0.9999998

## b)
####

LogLikelihoodH0 <- function(theta, y, n) {
  LogLikelihood(c((2 + theta) / 4, (1 - theta) / 4,
                  (1 - theta) / 4), y, n)
}

NegativeLogLikelihoodH0 <- function(...) {
  - LogLikelihoodH0(...)
}

opt.hzero <- optim(runif(1), NegativeLogLikelihoodH0, y = y, n = n,
                   hessian = TRUE)
(theta.hat <- opt.hzero$par)
# 0.0357236506373738

(theta.hat.var <- solve(opt.hzero$hessian)[1])
# 3.63072505048225e-05

(LRT <- 2 * (LogLikelihood(p.hat, y, n) - LogLikelihoodH0(theta.hat, y, n)))
# 2.01858568600073

(LRT.pvalue <- 1 - pchisq(LRT, df = 2))
# 0.364476630661476

## c)
####

# Done in (b).


## d)
####

alpha <- 0.05

## Classic Wald Confidence Interval.
theta.hat + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(theta.hat.var)
# 0.0238929671430484 0.0474947392364342


## Likelihood Ratio Confidence Interval.
## We'll look for the intersection between LogLikelihood function and Chisq critic value.

f <- function(theta, p, y, n, alpha, df) {
   2 * (LogLikelihood(p, y, n) - LogLikelihoodH0(theta, y, n)) - qchisq(1 - alpha / 2, df = df) / 2
}

c(uniroot(f, c(0, theta.hat), p.hat, y, n, alpha, df=2)$root,
  uniroot(f, c(theta.hat, 1), p.hat, y, n, alpha, df=2)$root)
# 0.0284208783973581 0.0440214323667942
