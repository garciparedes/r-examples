## Author: Sergio García Prado
## Title: Durret - Exercise 4.31

rm(list = ls())


PMinExp <- function(x1, x2) {
  x1 / (x1 + x2)
}

P <- function(lambdax, lambda1, lambda2) {
  (PMinExp(lambda1, lambda2) * PMinExp(lambda2, lambdax) +
    PMinExp(lambda2, lambda1) * PMinExp(lambda1, lambdax))
}

EExp <- function(lambda) {
  1 / lambda
}

EminExp <- function(lambda1, lambda2) {
  EExp(lambda1 + lambda2)
}

EMaxExp <- function(lambda1, lambda2) {
  EExp(lambda1) + EExp(lambda2) - EminExp(lambda1, lambda2)
}

lambda.kitchen <- 2
lambda.bathroom <- 3 / 2
lambda.single <- 1
lambda.together <- 2

(expected.time <- EMaxExp(lambda.kitchen, lambda.bathroom) +
    EExp(lambda.together) * P(lambda.single, lambda.kitchen, lambda.bathroom))
# 1.19523809523809
