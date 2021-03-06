## Author: Sergio García Prado
## Title: Exercises with Solutions 2

rm(list = ls())

Q <- matrix(c(-20,  20,   0,   0,   0,  0,
               30, -50,  20,   0,   0,  0,
                0,  60, -80,  20,   0,  0,
                0,   0,  60, -80,  20,  0,
                0,   0,   0,  60, -80,  20,
                0,   0,   0,   0,  60, -60),
              6, 6, byrow = TRUE)

(A <- cbind(Q[, 1:(nrow(Q) - 1)], rep(1, nrow(Q))))
# -20	 20	  0	  0	  0	1
#  30	-50	 20	  0	  0	1
#   0	 60	-80	 20	  0	1
#   0	  0	 60	-80	 20	1
#   0	  0	  0	 60	-80	1
#   0	  0	  0	  0	 60	1

## Should be solved via detailed balance equations...
(stationary <- solve(A)[nrow(A), ])
# 0.501030927835052 0.334020618556701 0.111340206185567
# 0.037113402061855 0.012371134020618 0.004123711340206

(r <- -Q / diag(Q))
# -1.0	1.00	0.00	0.00	0.00	0.00
#  0.6 -1.00	0.40	0.00	0.00	0.00
#  0.0  0.75 -1.00	0.25	0.00	0.00
#  0.0	0.00	0.75 -1.00	0.25	0.00
#  0.0	0.00	0.00	0.75 -1.00	0.25
#  0.0	0.00	0.00	0.00	1.00 -1.00

(not.busy <- r[4, 3])
# 0.75
