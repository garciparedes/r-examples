## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 07

rm(list = ls())

x1 <- c(26, 28, 34, 48, 21, 22, 34)
x2 <- c(28, 27, 42, 44, 17, 6, 16)


(s <- (x1 - x2)[x1 != x2])
# -2 1 -8 4 4 16 18

(n.s <- length(s))
# 7

(W <- sum((s > 0) * rank(abs(s))))
# 21


(W.mean <- n.s * (n.s + 1) / 4)
# 14

(W.var <- n.s * (n.s + 1) * (2 * n.s + 1) / 24)
# 35

## Asymptotic
pnorm((W - W.mean) / sqrt(W.var))
# 0.881638214681071

## Exact (not valid with ties)
psignrank(W, n.s)
# 0.890625

wilcox.test(x1, x2, paired = TRUE, alternative = "less", correct = FALSE)
# Warning message in wilcox.test.default(x1, x2, paired = TRUE, alternative = "less", :
# “cannot compute exact p-value with ties”
#
# 	Wilcoxon signed rank test
#
# data:  x1 and x2
# V = 21, p-value = 0.8821
# alternative hypothesis: true location shift is less than 0
