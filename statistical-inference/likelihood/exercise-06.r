rm(list = ls())

n <- 50
k <- 3
y <- c(8, 14)


menosLogLikelihood <- function(theta, y, n) {
  p1 <- theta[1]
  p2 <- theta[2]
  l <- sum(y * log(theta)) + (n - sum(y)) * log(1 - sum(theta))
  return(-l)
}

p.init <- c(0.3, 0.3)
opt <- optim(p.init, menosLogLikelihood, y=y, n=n, hessian = TRUE)

(emv <- opt$par)
emv.value <- opt$value

info.obs <- opt$hessian
(v.hat <- solve(info.obs))

(residual.standard <- sqrt(diag(v.hat)))


# Hipothesis H0: p2 - 2p1 = 0

p.obs <- emv[2] - 2 * emv[1]
p.0 <- 0

# WALD

wald.var <- t(c(2, -1)) %*% v.hat %*% c(2, -1)
wald.obs <- (p.obs - p.0) ^ 2 / wald.var
(wald.pvalue <- 1 - pchisq(wald.obs, 1))

# LIKELIHOOD RATIO

# TODO
likeratio.obs <- 2 * 0 

(likeratio.pvalue <- 1 - chisq(likeratio.obs, 1))








