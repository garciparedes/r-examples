## Author: Sergio García Prado

rm(list = ls())


## a)
####

##
## Asyntotic distibution of p.hat as parameter p of Bin(n, p)
## p.hat ~ N(p, p * (1 - p) / n)
##


## b)
####

n <- 100
y <- 15
alpha <- 0.05

LogLikelihood <- function(p, y, n) {
  y * log(p) + (n - y) * log(1 - p)
}

NegativeLogLikelihood <- function(...) {
  - LogLikelihood(...)
}

opt <- optim(runif(1), NegativeLogLikelihood, y = y, n = n, hessian = TRUE,
             method = "Brent", lower=10e-3, upper = 1 - 10e-3)

(p.hat <- opt$par)
# 0.149999999993663

(p.hat.var <- 1 / opt$hessian[1])
# 0.001274903

## Wald's Confidence Interval at (1 - alpha)% level

p.hat + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(p.hat.var)
# 0.0800179459640629 0.219982054023264


## c)
####
(p.zero <- 1 / 3)

(W <- (p.hat - p.zero) ^ 2 / p.hat.var)
# 26.3616557734205

(W.pvalue <- 1 - pchisq(W, df=1))
# 2.83105275666884e-07


## d)

(LRT <- 2 * (LogLikelihood(p.hat, y, n) - LogLikelihood(p.zero, y, n)))
# 17.345619477233

(LRT.pvalue <- 1 - pchisq(LRT, df=1))
# 3.11615708954438e-05
