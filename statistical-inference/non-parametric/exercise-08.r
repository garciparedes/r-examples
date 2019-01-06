## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 08

rm(list = ls())

x1 <- c(1, 3, 3)  # c('A', 'C', 'C')
x2 <- c(2, 2, 3)  # c('B', 'B', 'C')


(s <- (x2 - x1)[x2 != x1])
# 1 -1

(n <- length(s))
# 2

(V <- sum((s > 0) * rank(abs(s))))
# 1.5


(V.mean <- n * (n + 1) / 4)
# 1.5

(V.var <- n * (n + 1) * (2 * n + 1) / 24)
# 1.25

## Asymptotic pvalue (with continuity correction, without tie correction)
1 - pnorm(V - 0.5, mean = V.mean, sd = sqrt(V.var))
# 0.672639576990711

## Asymptotic pvalue (with continuity correction, with tie correction)
# TODO

## Exact pvalue (not valid with ties)
1 - psignrank(V - 1, n)
# 0.5

wilcox.test(x1,  x2, paired = TRUE, alternative = "greater", exact = FALSE)
# Wilcoxon signed rank test with continuity correction
#
# data:  x1 - x2
# V = 1.5, p-value = 0.6813
# alternative hypothesis: true location is greater than 0
