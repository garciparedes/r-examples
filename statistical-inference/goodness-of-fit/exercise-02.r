rm(list = ls())

k <- 10

y1 <- c(9, 3, 8, 14, 2, 13, 12, 19, 9, 4)
n1 <- sum(y1)



e1 <- rep(1 / k * n1, k)

Q <- sum((y1 - e1) ^ 2 / e1)

(pvalue <- 1 - pchisq(Q, k - 1))


y2 <- c(3, 4, 2, 14, 5, 6, 3, 17, 14, 12)
n2 <- sum(y2)

ey2 <- y2 / n2 * n1
ey1 <- y1 / n1 * n2

Q1 <- sum((y1 - ey2) ^ 2 / ey2)
Q2 <- sum((y2 - ey1) ^ 2 / ey1)

1 - pchisq(Q1, k - 1)
1 - pchisq(Q2, k - 1)


Q <- sum((y2 - e1) ^ 2 / e1)
(pvalue <- 1 - pchisq(Q, k - 1))
