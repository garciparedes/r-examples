## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 11

rm(list = ls())

n <- 40 - 1  # due to there was one tie
# 39

V <- 242

(V.mean <- n * (n + 1) / 4)
# 390

(V.var <- n * (n + 1) * (2 * n + 1) / 24)
# 5135

## Asymptotic pvalue (with continuity correction)
2 * (1 - pnorm(abs(V + 0.5 * sign(V.mean - V) - V.mean) / sqrt(V.var)))
# 0.039555378139781

## Exact
2 * (1 - psignrank(V - (V.mean < V), n, lower.tail = V.mean < V))
# 0.0385776563234685
