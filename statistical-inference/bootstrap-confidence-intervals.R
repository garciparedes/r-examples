rm(list = ls())


sample.size <- 30

x <- rnorm(sample.size)
x.mean <- mean(x)
x.sd <- sd(x)

alpha <- 0.05


# IC analítico
x.mean + c(-1, 1) * qt(1 - alpha / 2, df = sample.size - 1) * x.sd / sqrt(sample.size - 1)


# Bootstrap
simulation.size <- 5000

## Bootstrap paramétrico
y <- matrix(rnorm(sample.size * simulation.size, mean = x.mean, sd = x.sd),
            simulation.size, sample.size)
z <- apply(y, 1, mean)

quantile(z, probs = c(alpha / 2, 1 - alpha / 2))


## Bootstrap no paramétrico
y <- matrix(sample(x, sample.size * simulation.size, replace = TRUE),
            simulation.size, sample.size)
z <- apply(y, 1, mean)

quantile(z, probs = c(alpha / 2, 1 - alpha / 2))

