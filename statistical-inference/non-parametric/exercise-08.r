## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 08

rm(list = ls())

x1 <- c(1, 3, 3)  # c('A', 'C', 'C')
x2 <- c(2, 2, 3)  # c('B', 'B', 'C')


(s <- (x2 - x1)[x2 != x1])
# 1 -1

(n.s <- length(s))
# 2

(W <- sum((s > 0) * rank(abs(s))))
# 1.5


(W.mean <- n.s * (n.s + 1) / 4)
# 1.5

(W.var <- n.s * (n.s + 1) * (2 * n.s + 1) / 24)
# 1.25

## Asymptotic pvalue
1 - pnorm((W - W.mean) / sqrt(W.var))
# 0.5

## Exact pvalue
1 - psignrank(W - 1, n.s)
# 0.5

wilcox.test(x1 - x2, alternative = "greater", correct = FALSE)
# Warning message in wilcox.test.default(x1 - x2, alternative = "greater", correct = FALSE):
# “cannot compute exact p-value with ties”Warning message in wilcox.test.default(x1 - x2, alternative = "greater", correct = FALSE):
# “cannot compute exact p-value with zeroes”
#
# 	Wilcoxon signed rank test
#
# data:  x1 - x2
# V = 1.5, p-value = 0.5
# alternative hypothesis: true location is greater than 0
