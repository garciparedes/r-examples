#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Data Transformations form ANOVA 
#

# Transformations of (0,inf] Data
x <- 0:100
y <- cbind(log(x), sqrt(x))
matplot(x, y, type = "l")

# Transformations of [0,1] Data
x <- seq(0,1,0.01)
plot(x, asin(sqrt(x)), type = "l")
