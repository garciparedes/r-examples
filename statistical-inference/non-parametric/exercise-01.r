## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 01

rm(list = ls())

x <- c(518, 174, 613, 2010, 2139, 156, 450, 536)
(n.x <- length(x))
# 8

y <- c(899, 326, 2118, 839, 820, 1423, 1687, 1010, 3011, 1739, 1185, 1320, 646,
       505, 4236, 4481, 1433, 1806, 400, 421, 335, 1164, 1713, 1356, 390)
(n.y <- length(y))
# 25

(n <- n.x + n.y)
# 33


sum(duplicated(c(y, x))) > 0
# FALSE

(W <- sum(rank(c(y, x))[1:length(y)]))
# 459

(W.mean <- n.y * (n + 1) / 4)
# 212.5

(W.var <- (n.y * n.x * (n + 1)) / 12)
# 566.666666666667

(W.yx <-  W - n.y * (n.y + 1) / 2)
# 134

(W.yx.mean <- n.x * n.y  / 2)
# 100

(W.yx.var <- n.x * n.y * (n + 1) / 12)
# 566.667

### H0: X <= Y

## Asymptotic
1 - pnorm((W.yx - W.yx.mean) / sqrt(W.yx.var))
# 0.0766048231097839

## Exact
1 - pwilcox(W.yx - 1, n.y, n.x)
# 0.0812147313815834

### Shift Parameter Estimation

a <- matrix(rep(0, n.x * n.y), n.x, n.y)
for (i in 1:n.x) {
  for (j in 1:n.y) {
    a[i, j] <- y[j] - x[i]
  }
}

# Exact
median(a)
# 491

wilcox.test(y, x, alternative = "greater", conf.int = TRUE)
# Wilcoxon rank sum test
#
# data:  y and x
# W = 134, p-value = 0.08121
# alternative hypothesis: true location shift is greater than 0
# 95 percent confidence interval:
#  -60 Inf
# sample estimates:
# difference in location
#                    491
