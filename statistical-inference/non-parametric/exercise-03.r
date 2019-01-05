## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 03

rm(list = ls())

## H0: T(x) >= C(x)
## H1: T(x) < C(x)

n.c <- 9
n.t <- 9

(n <- n.c + n.t)
# 18

(W.t <- sum(1:8) + 18)
# 54

(W.t.mean <- n.t * (n + 1) / 2)
# 85.5

(W.t.var <- n.t * n.c * (n + 1) / 12)
# 128.25

(W.tc <- W.t - n.t * (n.t + 1) / 2)
# 9

(W.tc.mean <- n.t * n.c / 2)
# 40.5

(W.tc.var <- n.t * n.c * (n + 1) / 12)
# 128.25

pnorm((W.tc - W.tc.mean) / sqrt(W.tc.var))
# 0.00270526692804244


pwilcox(W.tc, n.t, n.c)
# 0.00199506375976964

## We'll reject H0 because there aren't enough evidences in favor of T >= C,
## so we assume that T < C
