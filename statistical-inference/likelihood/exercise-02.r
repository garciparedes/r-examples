## Author: Sergio García Prado

rm(list = ls())


## a)
####

##
## Asymptotic distibution of lambda.hat as parameter lambda of Pois(lambda)
## lambda.hat ~ N(lambda, lambda / n)
##


## b)
####
n <- 50
y <- 75  # sum(x_i)
alpha <- 0.05

LogLikelihood <- function(lambda, y, n) {
  y * log(lambda) - n * lambda
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(runif(1), NegativeLogLikelihood, y = y, n = n, hessian = TRUE,
             lower = 10e-3, upper = 10e3, method="Brent")

(lambda.hat <- opt$par)
# 1.49999997506721

(lambda.hat.var <- 1 / opt$hessian[1])
# 0.0299999723347587

## Wald's Confidence Interval at (1 - alpha)% level.
lambda.hat + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(lambda.hat.var)
# 1.16052441137235 1.83947553876206


## c)
####
lambda.zero <- 1

(W <- (lambda.hat - lambda.zero) ^ 2 / lambda.hat.var)
# 8.33334018703586

(W.pvalue <- 1 - pchisq(W, df = 1))
# 0.00389240243808919


## d)
####

(LRT <- 2 * (LogLikelihood(lambda.hat, y, n) - LogLikelihood(lambda.zero, y, n)))
# 10.8197662162247

(LRT.pvalue <- 1 - pchisq(LRT, df = 1))
# 0.0010042216868813
