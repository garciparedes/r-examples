## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 06

rm(list = ls())

a <- c(6.0, 5.8, 6.5, 6.3)

n.a <- length(a)
# 4

b <- c(7.3, 6.6, 7.1)

n.b <- length(b)
# 3

A <- matrix(rep(0, n.a * n.b), n.a, n.b)
for(i in 1:n.a) {
  for(j in 1:n.b) {
    A[i, j] <- a[i] - b[j]
  }
}
median(A)
# -0.8

alpha <- 0.1

## Resampling method (not equal results)
fn <- function(a, b, n.a, n.b) {
  a.resampled <- sample(a, n.a, replace = TRUE)
  b.resampled <- sample(b, n.b, replace = TRUE)
  A <- matrix(rep(0, n.a * n.b), n.a, n.b)
  for(i in 1:n.a) {
    for(j in 1:n.b) {
      A[i, j] <- a.resampled[i] - b.resampled[j]
    }
  }
  return(median(A))
}
quantile(replicate(1000, fn(a, b, n.a, n.b)), c(alpha / 2, 1 - alpha / 2), names = FALSE)
# -1.3, -0.45


## Exact Method
sort(A)[c(qwilcox(alpha / 2, n.a, n.b), qwilcox(1 - alpha / 2, n.a, n.b) + 1)]
# -1.5 -0.1


## Function
wilcox.test(a, b, alternative = "two.sided", conf.int = TRUE, conf.level = 0.9)
# Wilcoxon rank sum test
#
# data:  a and b
# W = 0, p-value = 0.05714
# alternative hypothesis: true location shift is not equal to 0
# 90 percent confidence interval:
#  -1.5 -0.1
# sample estimates:
# difference in location
#                   -0.8
