#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Naive k-means implementation 
#

rm(list = ls())

naiveKmeans <- function(data, k, tol = 0.1) {
    
  train <- function(data, k, tol) {
    ranges <- sapply(data, range)
    coordinates <- runif(dim(ranges)[2] * k, min=ranges[1,], max=ranges[2,])
    centers <- t(matrix(data = (coordinates), ncol = k))
    colnames(centers)<-colnames(data)
    distance <-  as.matrix(dist(rbind(centers, data), upper=TRUE))[,1:k]
    dataClass <- apply(distance, 1,which.min)
    
    reached=FALSE
    while (reached == FALSE) {
      for (i in 1:k) {
        centers[i,] = colMeans(data[dataClass == i,], na.rm = TRUE)
      }
      
      newDistance <-  as.matrix(dist(rbind(centers, data), upper=TRUE))[,1:k]
      newDataClass <- apply(distance, 1,which.min)
      
      if ((sum(newDataClass != dataClass) / dim(data)[1]) < tol){
        reached = TRUE
      }
    }

    distance <-  as.matrix(dist(rbind(centers, data), upper=TRUE))[,1:k]
    dataClass <- apply(distance, 1,which.min)
    plot(data, col= dataClass + 1)
  }
  
  centers <- train(data, k, tol)

  
  predict <- function(obs) {
    
  }
  
  
}

# Spherical and Normal Dataset
n <- 100
data <- data.frame(rbind(
  cbind(rnorm(n, 3), rnorm(n,-20)),
  cbind(rnorm(n, 9), rnorm(n,7)), 
  cbind(rnorm(n, -3), rnorm(n,-2))
))
data.kmeans <- naiveKmeans(data, 3)

data(iris)

k <- 3
iris.use <- iris[,-c(5)]

iris.kmeans <- naiveKmeans(iris.use, 3)
plot(iris[,1:4], col= as.numeric(iris[,5]) + 1)
