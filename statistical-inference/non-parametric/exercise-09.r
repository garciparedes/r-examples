## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 09

rm(list = ls())

x.f <- c(5, 7, 16, 12)
y.f <- c(7, 9, 15, 9)

(x <- rep(1:length(x.f), x.f))

(n.x <- length(x))
# 40

(y <- rep(1:length(y.f), y.f))

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

1 - pnorm((W.yx - W.yx.mean) / sqrt(W.yx.var))
# 0.832038093424132

1 - pwilcox(W.yx - 1, n.y, n.x)
# 0.832293774410869

wilcox.test(y, x, alternative = "greater")







