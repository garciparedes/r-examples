
lambda <- 0.5
sample.size <- 35
simulation.size <- 500

x <- rexp(sample.size, lambda)
x.emv.lambda <- 1 / mean(x)

y <- matrix(sample(x, size = sample.size * simulation.size, replace = TRUE),
            simulation.size, sample.size)

z <- 1 / apply(y, 1, mean) - x.emv.lambda

hist(z)
mean(z)
var(z)
