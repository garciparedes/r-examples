#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Derivative limit convergence on R
#

f <- function(x) {
  3 * x ^ 3 + pi * x ^ 2 + 1 / 2 
}

x <- 2
n <- seq(0, 5, 0.5)

df <- function(x, n = 100) {
  (f(x + 10 ^ - n) - f(x)) / 10 ^ - n
}

df(x, n)


plot(df(x, n), type = "l")
