## Author: Sergio García Prado
## Title: Statistical Inference - Non parametric Tests - Exercise 11

rm(list = ls())

n <- 40

n.s <- n - 1  # because there was one tie
# 39

V <- 242

(V.mean <- n.s * (n.s + 1) / 4)
# 390

(V.var <- n.s * (n.s + 1) * (2 * n.s + 1) / 24)
# 5135

## Asymptotic pvalue (with continuity correction)
2 * (1 - pnorm(abs(V - 0.5 - V.mean) / sqrt(V.var)))
# 0.0382358702696617

## Exact
2 * (1 - psignrank(V - 1, n.s, lower.tail = V.mean < V))
# 0.0372345517098438
