rm(list = ls())


y <- c(967, 1008, 975, 1022, 1003, 989, 1001, 981, 1043, 1011)
n <- sum(y)
k <- length(y)


e <- 1 / k * n

Q <- sum((y - e) ^ 2 / e)

(pvalue <- 1 - pchisq(Q, k - 1))
