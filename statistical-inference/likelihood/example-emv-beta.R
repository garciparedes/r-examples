rm(list = ls())

n <- 10
a <- 2
b <- 2


x <- rbeta(n, a, b)

A <- sum(log(x))
B <- sum(log(1 - x))

LogLikelihood <- function(theta, A, B, n) {
  a <- theta[1]
  b <- theta[2]
  
  l <- - n * lbeta(a, b) + (a - 1) * A + (b - 1) * B
  return(l)
}
menosLogLikelihood <- function(theta, ...) {
  - LogLikelihood(theta, ...)
}

theta.init <- c(1, 1)
opt <- optim(theta.init, menosLogLikelihood, A=A, B=B, n=n, hessian = TRUE)

(theta.hat <- opt$par)
(v.hat <- solve(opt$hessian))
(residuals.standard <- sqrt(diag(v.hat)))

alpha <- 0.05

# WALD IC for a.hat
(theta.hat[1] + c(-1, 1) * qnorm(1 - alpha / 2) * (residuals.standard[1]))

# WALD IC for b.hat
(theta.hat[2] + c(-1, 1) * qnorm(1 - alpha / 2) * (residuals.standard[2]))

test <- theta.hat[1] - theta.hat[2]
test.var <- t(c(1, -1)) %*% v.hat %*% c(1, -1) 
# El vector c(1, -1) se corresponde con las derivadas primeras de la transformación test

test.0 <- 0

wald.obs <- (test - test.0)  ^ 2 / test.var

(wald.pvalue <- 1 - pchisq(wald.obs, 1))

menosLogLikelihoodH0 <- function(a, ...) {
  theta <- c(a, a)
  - LogLikelihood(theta, ...)
}

opt.h0 <- optim(1, menosLogLikelihoodH0, A=A, B=B, n=n, hessian = TRUE)

emv.h0 <- c(opt.h0$par, opt.h0$par)

likeratio.obs <- 2 * (LogLikelihood(theta.hat, A, B, n) - LogLikelihood(emv.h0, A, B, n))

(likeratio.pvalue <- 1 - pchisq(likeratio.obs, 1))



# Confidence Region of Likelihood Ratio

region.delimiter <- LogLikelihood(emv.h0, A, B, n) - pchisq(1 - alpha, 2) / 2

region.x <- seq(0, 4, length.out = 100)
region.y <- seq(0, 4, length.out = 100)

region.func <- outer(region.x, region.y, function(a, b) {
  - n * lbeta(a, b) + (a - 1) * A + (b - 1) * B
})
contour(region.x, region.y, region.func, levels = c(region.delimiter))

