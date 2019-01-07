## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 02

rm(list = ls())

x <- c(5.2, 8.5, 9.8, 12.3, 17.1, 17.9, 23.7, 29.8)

(n.x <- length(x))
# 8

y <- c(1.1, 2.3, 3.2, 6.3, 7.0, 7.2, 9.1, 15.2, 18.3, 21.1)

(n.y <- length(y))
# 1.1, 2.3, 3.2, 6.3, 7.0, 7.2, 9.1, 15.2, 18.3, 21.1

(n <- n.x + n.y)
# 18

sum(duplicated(c(y, x))) > 0
# FALSE


(W <- sum(rank(c(y, x))[1:length(y)]))
# 76

(W.mean <- n.y * (n + 1) / 2)
# 95

(W.var <- n.y * n.x * (n + 1) / 12)
# 126.67

(W.yx <- W - n.y * (n.y + 1) / 2)
# 21

(W.yx.mean <-  n.x * n.y / 2)
# 40

(W.yx.var <- n.x * n.y * (n + 1) / 12)
# 126.67

### H0: X >= Y

## Asymptotic pvalue (with continuity correction)
pnorm((W.yx + 0.5 - W.yx.mean) / sqrt(W.yx.var))
# 0.050112052808869

## Exact
pwilcox(W.yx, n.y, n.x)
# 0.0505507564331094

### Shift Parameter Estimation

a <- matrix(rep(0, n.x * n.y), n.x, n.y)
for(i in 1:n.x) {
  for(j in 1:n.y) {
    a[i, j] <- y[j] - x[i]
  }
}
median(a)
# -6.1


wilcox.test(y, x, alternative = "less", conf.int = TRUE)
# Wilcoxon rank sum test
#
# data:  y and x
# W = 21, p-value = 0.05055
# alternative hypothesis: true location shift is less than 0
# 95 percent confidence interval:
#  -Inf  0.4
# sample estimates:
# difference in location
#                   -6.1
