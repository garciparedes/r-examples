#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-11
# Title: Getting Started with Native Plots
#


rm(list = ls())

x <- seq(-7, 7, length.out = 50)
y <- dnorm(x)

# Scatter Plot
plot(x,y)

# Bar Plot
barplot(y)

z <- rnorm(500)

# Histogram
hist(z)

# Box Plot
boxplot(z)
