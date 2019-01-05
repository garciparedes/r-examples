## Author: Sergio García Prado

rm(list = ls())


## a)
####

## Asymptotic distibution of (p1.hat, p2.hat) as parameters p1 of Bin(n, p1) and
## p2 of Bin(n, p2) independent of each other.
##
## (p1.hat, p2.hat) ~ N_2( (p1, p2) , [p1 * (1 - p1) / n, 0;
##                                     0, p2 * (1 - p2) / n] )
##


## b)
####
n1 <- 50
y1 <- 35

n2 <- 50
y2 <- 40

n <- c(n1, n2)
y <- c(y1, y2)

alpha <- 0.05

LogLikelihood <- function(p, y, n) {
  sum(y * log(p) + (n - y) * log(1 - p))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(runif(2), NegativeLogLikelihood, y = y, n = n, hessian = TRUE,
              lower = rep(10e-3, 2), upper = rep(1 - 10e-3, 2), method = "L-BFGS-B")

(p.hat <- opt$par)
# 0.69999745777599 0.799999683303738

(p.hat.var <- solve(opt$hessian))
# 0.004199941	0.000000000
# 0.000000000	0.003199902

g.transform <- c(-2, 1)

(g.hat <- (g.transform %*% p.hat)[1])
# -0.59999999367853

(g.hat.var <- (g.transform %*% p.hat.var %*% g.transform)[1])
# 0.0199995879878169

## Wald's Confidence Interval at (1 - alpha)% level.
g.hat + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(g.hat.var)
# -0.87717790348746 -0.3228220838696


## b)
####
g.zero <- 0

(W <- (g.hat - g.zero) ^ 2 / g.hat.var)
# 18.0003059668258

(W.pvalue <- 1 - pchisq(W, df = 1))
# 2.20869627943765e-05

## b)
####

LogLikelihoodHZero <- function(pp, ...) {
  LogLikelihood(c(2 * pp, pp), ...)
}

NegativeLogLikelihoodHZero <- function(...) {
  - LogLikelihoodHZero(...)
}

opt.hzero <- optim(runif(1), NegativeLogLikelihoodHZero, y = y, n = n,
                   lower = 10e-3, upper = 0.5 - 10e-3, method = "L-BFGS-B" )

(LRT <- 2 * (LogLikelihood(p.hat, y, n) - LogLikelihoodHZero(opt.hzero$par, y, n)))
# 36.089146035026

(LRT.pvalue <- 1 - pchisq(LRT, df = 1))
# 1.88493831654313e-09
