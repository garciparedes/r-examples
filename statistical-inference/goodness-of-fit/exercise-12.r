## Author: Sergio García Prado
## Title: Statistical Inference - Goodness of Fit - Exercise 12

rm(list = ls())

y <- c(40, 24, 16, 14, 6)
n <- sum(y)

# a)
(e1 <- c(dpois(0:3, lambda = 1), 1 - ppois(3, lambda = 1)) * n)
(Q1 <- sum((y - e1) ^ 2 / e1))
(pvalue1 <- 1 - pchisq(Q1, df = length(y) -1))

## b)

(e2 <- c(dpois(0:2, lambda = 1), 1 - ppois(2, lambda = 1)) * n)
(y2 <- c(y[1:(length(y) - 2)], y[length(y) - 1] +  y[length(y)]))
(Q2 <- sum((y2 - e2) ^ 2 / e2))
(pvalue1 <- 1 - pchisq(Q2, df = length(y2) -1))


## c)

(e3 <- c(dpois(0:1, lambda = 1), 1 - ppois(1, lambda = 1)) * n)
(y3 <- c(y[1:(length(y) - 3)], sum(y[(length(y) - 2):length(y)])))
(Q3 <- sum((y3 - e3) ^ 2 / e3))
(pvalue3 <- 1 - pchisq(Q3, df = length(y3) - 1))


sapply(1:15, function(i) {
  y <- c(dnbinom(0:i, size = 2, prob = 2/3), 1 - pnbinom(i, size = 2, prob = 2 / 3))
  e <- c(dpois(0:i, lambda = 1), 1 - ppois(i, lambda = 1))
  Q <- 100 * sum((y - e) ^ 2 / e)

  power <- 1 - pchisq(qchisq(1 - 0.05, df = i - 1), df = i - 1, ncp = Q)
  return(power)
})

i <- 4
y <- c(dnbinom(0:i, size = 2, prob = 2/3), 1 - pnbinom(i, size = 2, prob = 2 / 3))
e <- c(dpois(0:i, lambda = 1), 1 - ppois(i, lambda = 1))

fn <- function(n) {
  Q <- n * sum((y - e) ^ 2 / e)
  1 - pchisq(qchisq(1 - 0.05, df = i - 1), df = i - 1, ncp = Q)
}

uniroot(function(n) {0.9 - fn(n)}, c(1, 300))
