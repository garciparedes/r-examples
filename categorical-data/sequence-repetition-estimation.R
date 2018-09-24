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


simulate = function (n, k, reps, alpha) {
  # We will look for: 1{k}|0{k}
  REGEX <- paste0("1{", k + 1, "}|0{", k + 1, "}")
  
  
  results <- rep(0, reps)
  for (r in 1:reps) {
    tries <- sample(0:1, n, replace = T)
    results[r] <- (length(grep(REGEX, paste(tries, collapse=""))) > 0 )
  }
  
  # Puntual Estimation
  (p <- mean(results))
  
  # Confidence Interval
  q <- qnorm(1 - alpha / 2, 0, 1)
  e <- q * sqrt(p * (1 - p) / reps)
  (CI <- c(p - e, p + e))
  
  return(list(p=p, CI=CI))
}

n <- 200
k <- 6
reps <- 10000
alpha <- 0.05

simulate(n, k, reps, alpha)

# Results:
#
# > simulate(n, k, reps, alpha)
# $p
# [1] 0.8048
# 
# $CI
# [1] 0.7970316 0.8125684
# 
# Sean: 
#   X = longitud máxima de racha
#
# Entonces:
#   P(X >= 6) = 0.8048
#   C(X >= 6, 95%) = [0.7970316, 0.8125684] 
#

