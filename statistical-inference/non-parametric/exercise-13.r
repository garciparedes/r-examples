## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 13

rm(list = ls())

a <- c(0.41, 0.45, 0.36, 0.49, 0.39, 0.54, 0.38, 0.43)
b <- c(0.38, 0.40, 0.32, 0.50, 0.31, 0.52, 0.32, 0.36)

(s <- (a - b)[a != b])
# 0.03 0.05 0.04 -0.01 0.08 0.02 0.06 0.07

(n <- length(s))
# 8

(V <- sum((s > 0) * rank(abs(s))))
# 35

(V.mean <- n * (n + 1) / 4)
# 18

(V.var <- n * (n + 1) * (2 * n + 1) / 24)
# 51

### H0: A(x) == B(x)
### H1: A(x) != B(x)

## Asymptotic pvalue (with continuity correction)
2 * (1 - pnorm(abs(V - 0.5 - V.mean) / sqrt(V.var)))
# 0.0208625823327655

## Exact pvalue
2 * (1 - psignrank(V - 1, n, lower.tail = V.mean < V))
# 0.015625

wilcox.test(a, b, paired = TRUE, alternative = "two.sided")
# Wilcoxon signed rank test
#
# data:  a and b
# V = 35, p-value = 0.01563
# alternative hypothesis: true location shift is not equal to 0
