#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Data Analysis of Vehicles DataSet 
#


data(iris)
head(iris)

k <- 3
iris.use <- iris[,-c(5)]


naiveKmeans <- function(data, k) {
  
  

  train <- function(data, k) {
    ranges <- sapply(data, range)
    coordinates <- (runif(dim(ranges)[2] * k, min=ranges[1,], max=ranges[2,]))
    centers <- t(matrix(data = (coordinates), ncol = k))
  }
  
  centers <- train(data, k)
  
  predict <- function(obs) {
    
  }
  
  
}

iris.kmeans <- naiveKmeans(iris.use, 3)