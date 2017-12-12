#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: https://stackoverflow.com/a/22343382/3921457
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Plot Regions natively on R
#

rm(list = ls())

x_lims <- c(-0.5, 1.5)
y_lims <- c(-0.5, 1.5)

plot(x_lims,y_lims, type='n')
conditions <- function(x,y) {
  c1 <- (0 < y)
  c2 <- (y < 1)
  c3 <- (0 < y/x)
  c4 <- (y/x < 1)
  return(c1 & c2 & c3 & c4)
}

x <- seq(x_lims[1],x_lims[2],length=100)
y <- seq(y_lims[1],y_lims[2],length=100)
z <- expand.grid(x=x,y=y)
z <- z[conditions(z$x,z$y),]
points(z, col="red")
