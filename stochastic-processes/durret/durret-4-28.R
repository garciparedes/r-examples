## Author: Sergio García Prado
## Title: Durret - Exercise 4.28

rm(list = ls())


Q <- matrix(c(-4,  3,  1,  0,
               4, -6,  2,  0,
               2,  3, -6,  1,
               0,  0,  2, -2),
            4, 4, byrow=TRUE)

(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))
# -4	 3	 1	1
#  4	-6	 2	1
#  2	 3	-6	1
#  0	 0	 2	1

(stationary <- solve(A)[nrow(A), ])
# 0.4	0.3	0.2	0.1


SatisfyDetailed <- function(stationary, Q) {
  for(i in 1:(nrow(Q) - 1)) {
    for(j in (i + 1):nrow(Q)) {
      if (abs(stationary[i] * Q[i, j] - stationary[j] * Q[j, i]) > 10e-6) {
        cat(paste0("{'i': ", i, ", 'j': ", j, "}\n") )
        return(FALSE)
      }
    }
  }
  return(TRUE)
}


SatisfyDetailed(stationary, Q)
# TRUE


(R <- Q[1:3, 1:3])
# -4	 3	 1
#  4	-6	 2
#  2	 3	-6


(g <- - solve(R) %*% rep(1, 3))
# 5.25
# 5.16
# 4.50
