## Author: Sergio García Prado

rm(list = ls())


## a)
####

## Asymptotic distibution of (mu.hat, var.hat) as parameters mu and var of N(mu, sigma).
##
## (mu.hat, var.hat) ~ N_2( (mu, sigma) , [var / n, 0;
##                                         0, 2 * var ^ 2  / n] )
##


## b)
####

## First of all, we'll generate a random sample with mean = 4, and var = 3
mu <- 4
sigma2 <- 16
n <- 100
alpha <- 0.05

x <- rnorm(n, mean = mu, sd = sqrt(sigma2))

LogLikelihood <- function(theta, x) {
  mu <- theta[1]
  sigma2 <- theta[2]
  n <- length(x)
  l <- (- n / 2) * log(2 * pi * sigma2) - sum((x - mu)  ^ 2) / (2 * sigma2)
  return(l)
}


NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}


opt <- optim(runif(2), NegativeLogLikelihood, x = x, hessian = TRUE,
             lower = c(-Inf, 10e-3), upper = c(Inf, Inf), method = "L-BFGS-B")

(theta.hat <- opt$par)
# 3.61228715639211 14.6246349377987

(theta.hat.var <- solve(opt$hessian))
# 0.1462463	0.000000
# 0.0000000	4.277599

## Confidence interval for mu
(theta.hat[1] + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(theta.hat.var[1, 1]))
# 3.82193880939507 4.46554400873399


## Confidence interval for sigma2
(theta.hat[2] + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(theta.hat.var[2, 2]))
# 10.5709673127919 18.6783025628054


## c)
####

g <- function(theta) {
  mu <- theta[1]
  sigma2 <- theta[2]

  result <- mu / sqrt(sigma2)

  return(result)
}

g.derivative <- function(theta) {
  mu <- theta[1]
  sigma2 <- theta[2]

  result <- c(1 / sqrt(sigma2), - mu / (2 * sqrt(sigma2 ^ 3)))

  return(result)
}

(g.hat <- g(theta.hat))
# 0.944582184004079

(g.hat.var <- (g.derivative(theta.hat) %*% theta.hat.var %*% g.derivative(theta.hat))[1])
# 0.0144611778114386

## Confidence Interval for g transformation
(g.hat + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(g.hat.var))
# 0.708887425765002 1.18027694224316

g.zero <- 1

## d)
####

(W <- (g.hat - g.zero) ^ 2 / g.hat.var)
# 0.212370967966977

(W.pvalue <- 1 - pchisq(W, df = 1))
# 0.644915376840866

## e)
####

LogLikelihoodH0 <- function(theta, x) {
  LogLikelihood(c(theta, theta ^ 2), x)
}

NegativeLogLikelihoodH0 <- function(...) {
  - LogLikelihoodH0(...)
}

opt.h0 <- optim(runif(1), NegativeLogLikelihoodH0, x = x,
                lower = 10e-3, method = "L-BFGS-B" )

(LRT <- 2 * (LogLikelihood(theta.hat, x) - LogLikelihoodH0(opt.h0$par, x)))
# 0.211977389743652

(LRT.pvalue <- 1 - pchisq(LRT, df = 1))
# 0.645221941352022
