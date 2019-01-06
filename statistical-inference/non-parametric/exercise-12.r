## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 12

rm(list = ls())

s <- c(0.464, 0.137, 2.455, -0.323, -0.068, 0.906, -0.513, -0.525, 0.595, 0.881,
      -0.482, 1.678, -0.057, -1.229, -0.486, -1.787, -0.261, 1.237, 1.046)

(n <- length(s))
# 19

(V <- sum((s > 0) * rank(abs(s))))
# 111

(V.mean <- n * (n + 1) / 4)
# 95

(V.var <- n * (n + 1) * (2 * n + 1) / 24)
# 617.5

### H0: X symmetric
### H1: X not symmetric

## Aymptotic pvalue (with continuity correction)
2 * (1 - pnorm(abs(V - 0.5 - V.mean) / sqrt(V.var)))
# 0.532789272835132

## Exact pvalue
2 * (1 - psignrank(V - 1, n, lower.tail = V.mean < V))
# 0.541217803955078

wilcox.test(s, alternative = "two.sided")
# Wilcoxon signed rank test
#
# data:  s
# V = 111, p-value = 0.5412
# alternative hypothesis: true location is not equal to 0