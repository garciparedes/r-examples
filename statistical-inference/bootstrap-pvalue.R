rm(list = ls())

sample.size <- 30
alpha <- 0.05
mu.0 <- 0

x <- rnorm(sample.size)
x.mean <- mean(x)
x.sd <- sd(x)

# Test exacto
(critic.value <- qt(1 - alpha / 2, df = sample.size - 1))
(x.t.obs <- abs(x.mean - mu.0) / x.sd * sqrt(sample.size - 1))
(p.value <- 2 * (1 - pt(x.t.obs, df = sample.size - 1)))


# Bootstrap
simulation.size <- 5000

## Bootstrap paramétrico
y <- matrix(rnorm(sample.size * simulation.size, mean = x.mean, sd = x.sd),
            simulation.size, sample.size)

z <- abs(apply(y, 1, mean) - mu.0) / apply(y, 1, sd) * sqrt(sample.size - 1)
(z.critic.value <- quantile(z, 0.975))
(p.value <- mean(z >= x.t.obs))

## Bootstrap no paramétrico
y <- matrix(sample(x, sample.size * simulation.size, replace = TRUE),
            simulation.size, sample.size)

z <- abs(apply(y, 1, mean) - mu.0) / apply(y, 1, sd) * sqrt(sample.size - 1)
(z.critic.value <- quantile(z, 0.975))
(p.value <- mean(z >= x.t.obs))

