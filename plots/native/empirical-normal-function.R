#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-11
# Title: Getting Started with Native Plots
#

rm(list = ls())

n_support <- 100
min_support <- -4
max_support <- 4
support <- as.matrix(seq(min_support, max_support, (max_support-min_support)/n_support))

plot(cbind(support, pnorm(support)), type="l", col=1)

for (n in c(5, 10, 100)) {
  x <- as.matrix(rnorm(n))
  F_10 <- rowSums(vapply(x, function(x) x<=support, logical(n_support+1)))
  lines(cbind(support, F_10 / n), type = "l",col =n)
}