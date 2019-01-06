## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 15

rm(list = ls())

x <- c(0.01, 0.02, 0.03, 0.01, 0.01, 0.01, 0.02, 0.04,
       0.05, 0.03, 0.02, 0.01, 0.06, 0.01, 0.01, 0.04)

y <- c(0.02, 0.04, 0.03, 0.01, 0.04, 0.06, 0.01, 0.01,
       0.05, 0.01, 0.04, 0.03, 0.04, 0.06, 0.03, 0.01)

(s <- (x - y)[x != y])
# -0.01 -0.02 -0.03 -0.05 0.01 0.03 0.02 -0.02 -0.02 0.02 -0.05 -0.02 0.03

(n <- length(s))
# 13

sum(duplicated(s))
# 5

(V <- sum((s > 0) * rank(abs(s))))
# 30.5

(V.mean <- n * (n + 1) / 4)
# 45.5

(V.var <- n * (n + 1) * (2 * n + 1) / 24)
# 204.75

# Asymptotic pvalue (with continuity correction, without tie correction)
2 * (1 - pnorm(abs(V + 0.5 * sign(V.mean - V) - V.mean) / sqrt(V.var)))
# 0.310896828516612

## Asymptotic pvalue (with continuity correction, with tie correction
# TODO

# Exact pvalue (not valid due to ties)
2 * (1 - psignrank(V - (V.mean < V), n, lower.tail = V.mean < V))
# 0.339599609375

wilcox.test(x, y, paired = TRUE, alternative = "two.sided", exact = FALSE)
# Wilcoxon signed rank test with continuity correction
#
# data:  x and y
# V = 49, p-value = 0.3388
# alternative hypothesis: true location shift is not equal to 0

