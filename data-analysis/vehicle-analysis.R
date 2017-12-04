#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Data Analysis of Vehicles DataSet 
#

rm(list =ls())

library(mlbench)
library(MASS)
library(ggplot2)
library(class)

error_cross_validation <- function(method, data, class_id, folds = 4) {
  model_formula <- as.formula(paste(class_id, " ~ ."))
  dim_data <- dim(data)
  fold_size <- floor(dim_data[1] / folds)
  fold_index <- seq(1, dim_data[1]+1, fold_size)
  error_rate <- rep(1, folds)
  if(folds > 1) {
    for (i in 1:folds) {
      current_index <- as.vector(seq(fold_index[i], fold_index[i+1] - 1, 1))
      data_train <- data[-current_index,]
      model <- method(formula = model_formula, data = data_train)
      data_test <- data[current_index,]
      prediction <- predict(model, data_test)
      error_rate[i] <- sum(prediction$class != data_test[,class_id]) / dim(data_test)[1]
    }
  } else {
    model <- method(formula = model_formula, data = data)
    prediction <- predict(model, data)
    error_rate <- sum(prediction$class != data[,class_id]) / dim(data)[1]
  }
  return(mean(error_rate))
}


error_apparent <- function(method, data, class_id) {
  error_cross_validation(method, data, class_id, folds = 1)
}

error_leave_one_out <- function(method, data, class_id) {
  error_cross_validation(method, data, class_id, folds = dim(data)[1])
}


data("Vehicle")

head(Vehicle)

Vehicle.use <- Vehicle

print(dim(Vehicle.use))

Vehicle.use.class <- Vehicle.use[,"Class"]

Vehicle.use.pca <- princomp(scale(Vehicle.use[, -c(19)]))
summary(Vehicle.use.pca)
plot(Vehicle.use.pca$scores[,c(1,2)], col=as.numeric(Vehicle.use.class) + 1)

Vehicle.use.lda <- lda(formula = Class ~., data = Vehicle.use)

error_cross_validation(lda, Vehicle.use, "Class", 10)
error_apparent(lda, Vehicle.use, "Class")
#error_leave_one_out(lda, Vehicle.use, "Class")

error_cross_validation(qda, Vehicle.use, "Class", 10)
error_apparent(qda, Vehicle.use, "Class")
#error_leave_one_out(qda, Vehicle.use, "Class")
