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


# Asymptotic (without correction)
2 * (1 - pnorm(abs(W.xy - W.xy.mean) / sqrt(W.xy.var)))
# 0.285805698723043

## Exact (not valid with ties)
2 * (1 - pwilcox(W.xy, n.x, n.y))
# 0.286012269292367


wilcox.test(x, y, alternative = "two.sided", correct = FALSE, exact = TRUE)
# Wilcoxon rank sum test
#
# data:  x and y
# W = 10756, p-value = 0.2123
# alternative hypothesis: true location shift is not equal to 0


















