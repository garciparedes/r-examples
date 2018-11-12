## Author: Sergio García Prado

rm(list = ls())

y <- c(7, 6, 8, 16, 13)
k <- length(y)
n <- sum(y)




LogLikelihood <- function(p, y, k) {
  l <- sum(y[1:(k - 1)] * log(p)) + y[k] * log(1 - sum(p))
  return(l)
}


NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

p.hat.initial <- rep(1 / k, k - 1)
opt <- optim(p.hat.initial[1:(k - 1)], NegativeLogLikelihood, y = y, k = k, hessian = TRUE)

(p.hat <- opt$par)
# 0.139976175373378 0.120217883250931 0.159986995019396 0.319854212163691

(p.hat.var <- solve(opt$hessian))
# 0.0024070858	-0.0003370446	-0.0004477195	-0.0008948212
# -0.0003370446	0.0021183563	-0.0003852716	-0.0007700115
# -0.0004477195	-0.0003852716	0.0026874471	-0.0010228592
# -0.0008948212	-0.0007700115	-0.0010228592	0.0043497380

## a)
####

LogLikelihood1H0 <- function(theta, y) {
  LogLikelihood(c(theta[1], theta[1], theta[1], theta[2]), y, 5)
}


NegativeLogLikelihood1H0 <- function(...) {
  - LogLikelihood1H0(...)
}

opt1.hzero <- optim(c(0.1, 0.1), NegativeLogLikelihood1H0, y = y, hessian = TRUE)

(LRT1 <-  2 * (LogLikelihood(p.hat, y, k) - LogLikelihood1H0(opt1.hzero$par, y)))
# 0.286670914555231

(LRT1.pvalue <- 1 - pchisq(LRT1, df = (k - 1) - 3))
# 0.59236182742952


## b)
####

g1 <- function(p) {
  c(p[1] - p[2],
    p[1] - p[3],
    p[1] + p[2] + p[3] + 2 * p[4] - 1)
}


g1.derivative <- function(p) {
  matrix(c(1, -1,  0, 0,
           1,  0, -1, 0,
           1,  1,  1, 2),
         3, 4, byrow = TRUE)
}

(g1.hat <- g1(p.hat))
# 0.0197582921224479 -0.0200108196460179 0.059889477971087

(g1.hat.var <- g1.derivative(p.hat) %*% p.hat.var %*% t(g1.derivative(p.hat)))
# 5.199531e-03	2.806578e-03	-2.333792e-05
# 2.806578e-03	5.989972e-03	2.394155e-05
# -2.333792e-05	2.394155e-05	1.152100e-02

(W1 <- t(g1.hat - rep(0, 3)) %*% solve(g1.hat.var) %*% (g1.hat - rep(0, 3)))
# 0.6002303

(W1.pvalue <- 1 - pchisq(W1, df = (k - 1) - 3))
# 0.4384902

## c)
####


LogLikelihood2H0 <- function(theta, y) {
  LogLikelihood(c(theta[1], 2 * theta[1], theta[2], theta[2]), y, 5)
}


NegativeLogLikelihood2H0 <- function(...) {
  - LogLikelihood2H0(...)
}

opt2.hzero <- optim(c(0.1, 0.1), NegativeLogLikelihood2H0, y = y, hessian = TRUE)

(LRT2 <-  2 * (LogLikelihood(p.hat, y, k) - LogLikelihood2H0(opt2.hzero$par, y)))
# 5.01968859661113

(LRT2.pvalue <- 1 - pchisq(LRT2, df = (k - 1) - 2))
# 0.0812808938285899


## d)
####

g2 <- function(p) {
  c(p[2] - 2 * p[1],
    p[3] - p[4])
}


g2.derivative <- function(p) {
  matrix(c(-2, 1,  0, 0,
            0, 1, -1, 0),
            2, 4, byrow = TRUE)
}

(g2.hat <- g2(p.hat))
# -0.120217883250931 -0.159867217144294

(g2.hat.var <- g2.derivative(p.hat) %*% p.hat.var %*% t(g2.derivative(p.hat)))
# 0.013094878	0.002282278
# 0.002282278	0.005576347

(W2 <- t(g2.hat - rep(0, 2)) %*% solve(g2.hat.var) %*% (g2.hat - rep(0, 2)))
# 5.314512

(W2.pvalue <- 1 - pchisq(W2, df = (k - 1) - 2))
# 0.07014043
