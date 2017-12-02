#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-11
# Title: Getting Started with Native Plots
#
rm(list = ls())

x_10 <- sort(rnorm(10))
x_100 <- sort(rnorm(100))
x_1000 <- sort(rnorm(1000))

plot(x_10, type = "o")
plot(x_100, type = "o")
plot(x_1000, type = "o")

