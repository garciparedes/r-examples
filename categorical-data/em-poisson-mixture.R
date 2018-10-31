rm(list = ls())

set.seed(123)

n <- 5000
l1 <- 2
l2 <- 7
z <- rbinom(1, n, 0.)

x <- c(rpois(z, l1), rpois(n - z, l2))

hist(x)

singleLogLikelihood <- function(p, l1, l2, x) {
  log(p * dpois(x, l1) + (1 - p) * dpois(x, l2))
}

negativeLogLikelihodParams <- function(p, l1, l2, x) {
  - sum(singleLogLikelihood(p, l1, l2, x))
}

negativeLogLikelihod <- function(theta, x) {
  p <- theta[1]
  l1 <- theta[2]
  l2 <- theta[3]
  
  negativeLogLikelihodParams(p, l1, l2, x)
}

negativeLogLikelihodParamsl1 <- function(l1, x) {
  - sum(singleLogLikelihood(1, l1, 0, x))
}

negativeLogLikelihodParamsl2 <- function(l2, x) {
  - sum(singleLogLikelihood(0, 0, l2, x))
}

updateTheta <- function(theta, x) {
  p <- theta[1]
  l1 <- theta[2]
  l2 <- theta[3]
  
  # opt <- optim(theta, negativeLogLikelihod, x = x, 
  #              lower = c(10e-4, 10e-4, 10e-4), upper = c(1 - 10e-4, Inf, Inf), 
  #              method = "L-BFGS-B")
  # theta <- opt$par
  
  
  opt <- optim(p, negativeLogLikelihodParams, x = x, l1 = l1, l2 = l2,
        lower = 10e-4, upper = 1 - 10e-4, method = "L-BFGS-B")
  p <- opt$par
  
  mask <- singleLogLikelihood(0, l1, l2, x) <= singleLogLikelihood(1, l1, l2, x)
  #print(mask)
  
  x1 <- x[mask]
  x2 <- x[!mask]
  
  opt <- optim(l1, negativeLogLikelihodParamsl1, x = x1,
               lower = 10e-4, method = "L-BFGS-B")
  l1 <- opt$par
  
  opt <- optim(l2, negativeLogLikelihodParamsl2, x = x2,
               lower = 10e-4, method = "L-BFGS-B")
  l2 <- opt$par
  
  theta <- c(p, l1, l2)
  
  return(theta)
}

re.runs <- 10
iterations <- 10
best.llikel <- Inf
for (k in 1:re.runs) {
  print(k)
  theta <- c(runif(1), runif(2) * 50)
  print(theta)
  for (itr in 1:iterations) {
    theta <- updateTheta(theta, x)
    print(theta)
  }
  llikel <- negativeLogLikelihod(theta, x)
  if (llikel < best.llikel) {
    best.llikel <- llikel 
    best.theta <- theta
  }
}
best.theta


k <- 50
l <- rep(NA, k)
p <- 1:k / k
for (i in 1:k) {
  theta <- runif(2) * 50
  l[i] <- - negativeLogLikelihodParams(p[i], l1, l2, x)
}
plot(p, l, type = "l")
