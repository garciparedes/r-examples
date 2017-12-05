#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Normal Mean Convergence 
#

n <- 1000

x <- 1:n
k <- 5
y <- matrix(rnorm(n * k), ncol=k)
matplot(x, apply(y, 2, cumsum) / x , type="l")
