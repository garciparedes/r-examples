#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Cauchy Mean Divergence 
#

n <- 1000

x <- 1:n
k <- 3
y <- matrix(rcauchy(n * k), ncol=k)
matplot(x, apply(y, 2, cumsum) / x , type="l")
