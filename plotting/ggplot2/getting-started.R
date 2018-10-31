#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-11
# Title: Getting Started with ggplot2 Plots
#


rm(list = ls())

library(ggplot2)

x <- seq(-7, 7, length.out = 50)
y <- dnorm(x)

df_xy <- as.data.frame(cbind(x,y))

# Scatter Plot
ggplot(data = df_xy, aes(x = x, y = y)) + geom_point()

# Bar Plot
ggplot(data = df_xy, aes(x = x, y = y)) + geom_bar(stat = "summary")

z <- rnorm(500)
df_z <- as.data.frame(z)

# Histogram
ggplot(data = df_z, aes(x = z)) + geom_histogram()

# Box Plot
ggplot(data = df_z, aes(x = "", y = z)) + geom_boxplot()

