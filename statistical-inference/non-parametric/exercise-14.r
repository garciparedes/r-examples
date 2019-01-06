## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 14

rm(list = ls())

x <- c(9.8, 10.1, 9.7, 9.9, 10.0, 10.0, 9.8, 9.7, 9.8, 9.9)

(s.x <- (x - 10)[x != 10])
# -0.199999999999999 0.0999999999999996 -0.300000000000001 -0.0999999999999996
# -0.199999999999999 -0.300000000000001 -0.199999999999999 -0.0999999999999996

sum(duplicated(s.x))
# 4

(n.s.x <- length(s.x))
# 8

(V.x <- sum((s.x > 0) * rank(abs(s.x))))
# 2

(V.x.mean <- n.s.x * (n.s.x + 1) / 4)
# 18

(V.x.var <- n.s.x * (n.s.x + 1) * (2 * n.s.x + 1) / 24)
# 51

### H0 median == 10
### H1 median != 10

## Asymptotic pvalue (with continuity correction, without tie correction)
2 * (1 - pnorm(abs(V.x + 0.5 - V.x.mean) / sqrt(V.x.var)))
# 0.0299739735865558

## Asymptotic pvalue (with continuity correction, with tie correction
# TODO

## Exact pvalue (not valid with ties)
2 * (1 - psignrank(V.x, n.s.x, lower.tail = V.x.mean < V.x))
# 0.0234375

wilcox.test(x - 10, alternative = "two.sided", exact = FALSE)
# Wilcoxon signed rank test with continuity correction
#
# data:  x - 10
# V = 2, p-value = 0.02818
# alternative hypothesis: true location is not equal to 0


y <- c(9.83, 10.09, 9.72, 9.87, 10.04, 9.95, 9.82, 9.73, 9.79, 9.90)

(s.y <- (y - 10)[y != 10])
# -0.17 0.0899999999999999 -0.279999999999999 -0.130000000000001 0.0399999999999991
#  -0.0500000000000007 -0.18 -0.27 -0.210000000000001 -0.0999999999999996

sum(duplicated(s.y))
# 0

(n.s.y <- length(s.y))
# 10

(V.y <- sum((s.y > 0) * rank(abs(s.y))))
# 4

(V.y.mean <- n.s.y * (n.s.y + 1) / 4)
# 27.5

(V.y.var <- n.s.y * (n.s.y + 1) * (2 * n.s.y + 1) / 24)
# 96.25

### H0 median == 10
### H1 median != 10

## Asymptotic pvalue (with continuity correction)
2 * (1 - pnorm(abs(V.y + 0.5 * sign(V.y.mean - V.y) - V.y.mean) / sqrt(V.y.var)))
# 0.0190588916017305

## Exact pvalue
2 * (1 - psignrank(V.y - (V.y.mean < V.y), n.s.y, lower.tail = V.y.mean < V.y))
# 0.013671875

wilcox.test(y - 10, alternative = "two.sided", exact = TRUE)
# Wilcoxon signed rank test
#
# data:  y - 10
# V = 4, p-value = 0.01367
# alternative hypothesis: true location is not equal to 0




