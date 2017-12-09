#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Naive k-means implementation 
#

rm(list = ls())

naiveKmeans <- function(data, k, tol = 0.1) {
  
  distance <- function(centers, data) {
    distances <- matrix(rep(0,3 * dim(data)[1]), ncol = dim(centers)[1])
    for (i in 1:dim(centers)[1]) {
      distances[,i] <- sqrt(colSums((centers[i,] - t(data))^2))
    }
    return(distances)
  }
  
  train <- function(data, k, tol) {
    ranges <- sapply(data, range)
    coordinates <- runif(dim(ranges)[2] * k, min=ranges[1,], max=ranges[2,])
    centers <- t(matrix(data = (coordinates), ncol = k))
    colnames(centers) <- colnames(data)
    distance <-  distance(centers, data)
    dataClass <- apply(distance, 1,which.min)
    reached=FALSE
    while (reached == FALSE) {
      for (i in 1:k) {
        centers[i,] = colMeans(data[dataClass == i,], na.rm = TRUE)
      }
      newDistance <-  distance(centers, data)
      newDataClass <- apply(distance, 1,which.min)
      if ((sum(newDataClass != dataClass) / dim(data)[1]) < tol){
        reached = TRUE
      }
    }
    return(centers)
  }
  
  centers <- train(data, k, tol)

  predict <- function(data) {
    distance <-  distance(centers, data)
    dataClass <- apply(distance, 1,which.min)
    names(dataClass) <- 1:dim(data)[1]
    return(dataClass)
  }

  value <- list(centers = centers, predict = predict)
  class(value) <- "naiveKmeans"
  return(value)
}

predict.naiveKmeans <- function(obj, data) {
  return(obj$predict(data))
}


# Spherical and Normal Dataset
n <- 300
data <- data.frame(rbind(
  cbind(rnorm(n, 3), rnorm(n,-20)),
  cbind(rnorm(n, 9), rnorm(n,7)), 
  cbind(rnorm(n, -3), rnorm(n,-2))
))
data.kmeans <- naiveKmeans(data, 3)
data.kmeans$centers
plot(data, col = predict(data.kmeans, data))


# Iris Dataset
data(iris)
iris.use <- iris[,1:4]
iris.kmeans <- naiveKmeans(iris.use, 3)
iris.kmeans$centers
plot(iris.use, col = predict(iris.kmeans, iris.use) + 1 )
