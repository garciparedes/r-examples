## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 07

rm(list = ls())

x1 <- c(26, 28, 34, 48, 21, 22, 34)
x2 <- c(28, 27, 42, 44, 17, 6, 16)


(s <- (x1 - x2)[x1 != x2])
# -2 1 -8 4 4 16 18

(n <- length(s))
# 7

(V <- sum((s > 0) * rank(abs(s))))
# 21

(V.mean <- n * (n + 1) / 4)
# 14

(V.var <- n * (n + 1) * (2 * n + 1) / 24)
# 35

## Asymptotic pvalue (with continuity correction, without tie correction)
pnorm(V + 0.5, mean = V.mean, sd = sqrt(V.var))
# 0.897553053091811

## Asymptotic pvalue (with continuity correction, with tie correction)

(ties <- table(abs(s)))
#  1  2  4  8 16 18
#  1  1  2  1  1  1

(V.var.corrected <- V.var - sum(ties ^ 3 - ties) / 48)
# 34.875

pnorm((V + 0.5 - V.mean) / sqrt(V.var.corrected))
# 0.897957911117213

## Exact pvalue (not valid with ties)
psignrank(V, n)
# 0.890625

wilcox.test(x1, x2, paired = TRUE, alternative = "less", exact = FALSE)
# Wilcoxon signed rank test with continuity correction
#
# data:  x1 and x2
# V = 21, p-value = 0.898
# alternative hypothesis: true location shift is less than 0
