## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 09

rm(list = ls())

x.f <- c(5, 7, 16, 12)
y.f <- c(7, 9, 15, 9)

x <- rep(1:length(x.f), x.f)

(n.x <- length(x))
# 40

y <- rep(1:length(y.f), y.f)

(n.y <- length(y))
# 40

(n <- n.x + n.y)
# 80

(W.y <- sum(rank(c(y, x))[1:n.y]))
# 1520

(W.yx <- W.y - n.y * (n.y + 1) / 2)
# 700

(W.yx.mean <- n.y * n.x / 2)
# 800

(W.yx.var <- n.y * n.x * (n + 1) / 12)
# 10800

## Asymptotic pvalue (with continuity correction, without tie correction)
1 - pnorm(W.yx - 0.5, mean = W.yx.mean, sd = sqrt(W.yx.var))
# 0.830827188754516

## Asymptotic pvalue (with continuity correction, with tie correction)
# W.xy.var.corrected <- TODO
#
# 1 - pnorm(W.yx + 0.5, mean = W.yx.mean, sd = sqrt(W.xy.var.corrected))
#

## Exact pvalue (not valid with ties)
1 - pwilcox(W.yx - 1, n.y, n.x)
# 0.832293774410869

wilcox.test(y, x, alternative = "greater", exact = FALSE)
# Wilcoxon rank sum test with continuity correction
#
# data:  y and x
# W = 700, p-value = 0.8443
# alternative hypothesis: true location shift is greater than 0

## We can't reject H0, so we assume that treatment is less or equal than
## control cases. pvalues are different due to ties correction.




