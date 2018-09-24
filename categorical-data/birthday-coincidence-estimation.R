#
# Title:
#   Análisis de Datos Categóricos - Sequence Repetition Estimation
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   September 2018
#

rm(list = ls())


simulate = function (days, people, reps, alpha) {
  sameBirthday <- rep(0, reps)
  for (r in 1:reps) {
    birthdays <- sample(1:days, people, replace = T)
    sameBirthday[r] <- any(duplicated(birthdays))
  }
  
  # Puntual Estimation
  (p <- mean(sameBirthday))
  
  # Confidence Interval
  q <- qnorm(1 - alpha / 2, 0, 1)
  e <- q * sqrt(p * (1 - p) / reps)
  CI <- c(p - e, p + e)
  
  return(list(p=p, CI=CI))
}

days <- 365
people <- 30 
reps <- 10000
alpha <- 0.05

simulate(days, people, reps, alpha)


# Results:
#
# > simulate(days, people, reps, alpha)
# $p
# [1] 0.7071
# 
# $CI
# [1] 0.6981803 0.7160197
# 
# Sean: 
#   X = coincidencias de cumpleaños
#
# Entonces:
#   P(X >= 2) = 0.7071
#   C(X >= 2, 95%) = [0.6981803, 0.7160197] 
#