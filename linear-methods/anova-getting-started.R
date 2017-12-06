#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: ANOVA Getting Started 
#

data(iris)
head(iris)
manova(cbind(Sepal.Length, Petal.Length,Petal.Length,Petal.Width) ~ Species,iris)
