### Author: Sergio García Prado
### Title: 2017 Final Exam

rm(list = ls())


### Exercise 1

P <- matrix(c(
  0.0, 1/2, 0.0, 1/2, 0.0, 0.0, 0.0, 0.0, 0.0,
  1/3, 0.0, 1/3, 0.0, 1/3, 0.0, 0.0, 0.0, 0.0,
  0.0, 1/2, 0.0, 0.0, 0.0, 1/2, 0.0, 0.0, 0.0,
  1/2, 0.0, 0.0, 0.0, 0.0, 0.0, 1/2, 0.0, 0.0,
  0.0, 1/3, 0.0, 0.0, 0.0, 1/3, 0.0, 1/3, 0.0,
  0.0, 0.0, 1/2, 0.0, 1/2, 0.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 0.0, 0.0, 1/2, 0.0, 0.0, 0.0, 1/2,
  0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0
),9, 9, byrow = TRUE)

R <- P[1:8, 1:8]

g <- solve(diag(nrow(R)) - R) %*% rep(1, nrow(R))

(doors <- g[1])
# 44.5

(visits.A <- solve(diag(nrow(R)) - R)[1, 1] - 1)
# 6.5

### Exercise 2

(l.coche <- (5 / 60) ^ (-1))
# 12

(l.moto <- (10 / 60) ^ (-1))
# 6

(l.bus <- (30 / 60) ^ (-1))
# 2

### a) 2 cars and 1 motorcycle in 20 minutes.
dpois(2, lambda = l.coche / 3) * dpois(1, lambda = l.moto / 3)
# 0.0396600348266617

### b) Non-change return in 10 minutes.
dpois(0, lambda = 1 / 4 * (l.coche + l.moto + l.bus) / 6)
# 0.434598208507078

### c) 0 motorcycles from 20 vehicles.
dbinom(0, size = 20, prob = l.moto / (l.coche + l.moto + l.bus))
# 0.000797922662976119

### d) 7th car before 2th motorcycle.
pbinom(7 - 1, size = 7 + 2 - 1, prob = l.coche / (l.coche + l.moto),
       lower.tail = FALSE)
# 0.195092211553117


### Exercise 3

lambda <- 9
# 9

(mu <- 1 /(5 /60))
# 12

### a)
##
## L ~ Geometric((mu - lambda) / mu) = Geometric(1/4)

## E[L]
lambda / (mu - lambda)
# 3

### b)

## Waiting Total.
(1 / (mu - lambda))
# 0.3333333

## Waiting in queue.
(lambda / mu * (1 / (mu - lambda)))
# 0.25

### c)

## Busy period length.
(1 / (mu - lambda))
# 0.333333333333333

### d)

R <- matrix(c(
  -lambda, lambda,
  mu, -(mu + lambda)
), 2, 2, byrow = TRUE)

(g <- - solve(R) %*% rep(1, 2))
# 0.3703704
# 0.2592593

g[1]
# 0.37037037037037
