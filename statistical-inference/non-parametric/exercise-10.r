## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 10

rm(list = ls())

x.f <- c(60, 21, 11, 4, 3, 1)
y.f <- c(130, 50, 10, 6, 4, 0)

x <- rep(1:length(x.f), x.f)
y <- rep(1:length(y.f), y.f)

(n.x <- length(x))
# 100

(n.y <- length(y))
# 200

(n <- n.x + n.y)
# 300

(W.x <- sum(rank(c(x, y))[1:n.x]))
# 15806

(W.xy <- W.x - n.x * (n.x + 1) / 2)
# 10756

(W.xy.mean <- n.x * n.y / 2)
# 10000

(W.xy.var <- n.x * n.y * (n.x + n.y + 1) / 12)
# 501666.67

(ties <- table(c(x, y)))
#   1   2   3   4   5   6
# 190  71  21  10   7   1

(W.xy.var.corrected <- n.x * n.y / 12 * ((n + 1) - sum(ties ^ 3 - ties) / (n * (n - 1))))
# 367381.716833891

# Asymptotic pvalue (with continuity correction, without tie correction)
2 * (1 - pnorm(abs(W.xy + 0.5 * sign(W.xy.mean - W.xy) - W.xy.mean) / sqrt(W.xy.var)))
# 0.286124467472471

## Asymptotic pvalue (with continuity correction, with tie correction)
2 * (1 - pnorm(abs(W.xy + 0.5 * sign(W.xy.mean - W.xy) - W.xy.mean) / sqrt(W.xy.var.corrected)))
# 0.21259835316298

## Exact pvalue (not valid with ties)
2 * (1 - pwilcox(W.xy - (W.xy.mean < W.xy), n.x, n.y, lower.tail = W.xy.mean < W.xy))
# 0.286650510800022


wilcox.test(x, y, alternative = "two.sided", exact = FALSE)
# Wilcoxon rank sum test with continuity correction
#
# data:  x and y
# W = 10756, p-value = 0.2126
# alternative hypothesis: true location shift is not equal to 0


















