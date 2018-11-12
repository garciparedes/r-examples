## Author: Sergio García Prado

rm(list = ls())

y <- c(160, 140, 40,
        40,  60, 60)
r <- 2
c <- 3

n <- sum(y)
k <- length(y)

LogLikelihood <- function(p, y, k) {
  sum(y[1:(k - 1)] * log(p)) + y[k] * log(1 - sum(p))
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(rep(1 / k, k - 1), NegativeLogLikelihood, y = y, k = k, hessian = TRUE)

(p.hat <- opt$par)
# 0.319974922618424 0.28001526572757 0.0800107004045124 0.0800170070336192 0.120016550720802

(p.hat.var <- solve(opt$hessian))
# 4.351396e-04	-1.792007e-04	-5.119362e-05	-5.120170e-05	-7.680441e-05
# -1.792007e-04	4.032054e-04	-4.480606e-05	-4.481313e-05	-6.722132e-05
# -5.119362e-05	-4.480606e-05	1.471927e-04	-1.280210e-05	-1.920362e-05
# -5.120170e-05	-4.481313e-05	-1.280210e-05	1.472139e-04	-1.920665e-05
# -7.680441e-05	-6.722132e-05	-1.920362e-05	-1.920665e-05	2.112222e-04


LogLikelihoodH0 <- function(theta, ...) {
  r1 <- theta[1]
  c1 <- theta[2]
  c2 <- theta[3]

  LogLikelihood(c(r1 * c1, (1 - r1) * c1, r1 * c2, (1 - r1) * c2, r1 * (1 - c1 - c2)), ...)
}

NegativeLogLikelihoodH0 <- function(...) {
  - LogLikelihoodH0(...)
}
opt.hzero <- optim(rep(1 / (r + c - 2), (r + c - 2)), NegativeLogLikelihoodH0, y = y, k = k)

(LRT <- 2 * (LogLikelihood(p.hat, y, k) - LogLikelihoodH0(opt.hzero$par, y, k)))
# 0.534117133722475

(LRT.pvalue <- 1 - pchisq(LRT, df = (k - 1) - 3))
# 0.765628229709977
