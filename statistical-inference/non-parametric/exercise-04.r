## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 04

rm(list = ls())

r <- c(1.1, -21.7, -16.3, -11.3, -10.4, -7.0, -2.0, 1.9, 6.2)

(n.r <- length(r))
# 9

u <- c(-2.4, 9.9, 14.2, 18.4, 20.1, 23.1, 70.4)

(n.u <- length(u))
# 7

(n <- n.u + n.r)
# 16

(W.u <- sum(rank(c(u, r))[1:length(u)]))
# 87

(W.ur <- W.u - n.u * (n.u + 1) / 2)
# 59

(W.ur.mean <- n.u * n.r / 2)
# 31.5

(W.ur.var <- n.u * n.r * (n + 1) / 12)
# 89.25

### a)
###
### H.0: U <= R
### H.1: U > R

1 - pnorm((W.ur - W.ur.mean) / sqrt(W.ur.var))
# 0.00180189663203889

1 - pwilcox(W.ur - 1, n.u, n.r)
# 0.00104895104895109

## We reject H.0 in favor of H.1, so U > R

### b)

A <- matrix(rep(0, n.u * n.r), n.u, n.r)
for (i in 1:n.u) {
  for (j in 1:n.r) {
    A[i, j] <- u[i] - r[j]
  }
}
median(A)
# 22.1


wilcox.test(u, r, alternative = "greater", conf.int = TRUE)
# Wilcoxon rank sum test
#
# data:  u and r
# W = 59, p-value = 0.001049
# alternative hypothesis: true location shift is greater than 0
# 95 percent confidence interval:
#  13.9  Inf
# sample estimates:
# difference in location
#                   22.1


### c)

## TODO

### d)

## TODO