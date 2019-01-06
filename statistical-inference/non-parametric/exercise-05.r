## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 05

rm(list = ls())


x <- c("B", "B", "B", "A", "A", "B", "A", "B", "B", "B", "B", "A", "B", "A", "A", "B", "A", "A", "A")

(n <- length(x))
# 19

(n.a <- sum(x == "A"))
# 9

(n.b <- n - n.a)
# 10

(W.a <- sum(which(x == "A")))
# 111

(W.ab <- W.a - n.a * (n.a + 1) / 2)
# 66

(W.ab.mean <- n.a * n.b / 2)
# 45

(W.ab.var <- n.a * n.b * (n + 1) / 12)
# 150

### H0: A(x) == B(x)
### H1: A(x) != B(x)

## Asymptotic pvalue
2 * (1 - pnorm(abs(W.ab - W.ab.mean) / sqrt(W.ab.var)))
# 0.0864107329737001

## Exact Pvalue
2 * (1 - pwilcox(W.ab - 1, n.a, n.b, lower.tail = W.ab.mean < W.ab))
# 0.0947195219641039

wilcox.test(which(x == "A"), which(x == "B"))
# Wilcoxon rank sum test
#
# data:  which(x == "A") and which(x == "B")
# W = 66, p-value = 0.09472
# alternative hypothesis: true location shift is not equal to 0

## If we choose alpha = 0.05, we don't have enought evidences to reject
## the hipothesis that both exam models takes same time to complete.
