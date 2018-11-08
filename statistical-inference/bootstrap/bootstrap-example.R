
sample_size <- 51
simulation_size <- 2000

# simulación
x <- matrix(rnorm(sample_size * simulation_size), sample_size, simulation_size)

z <- apply(x, 2, median)

var(z)


# Bootstrap

x <- rnorm(sample_size)
x.mean <- mean(x)
x.sd <- sd(x)

# Bootstrap paramétrico

y <- matrix(rnorm(sample_size * simulation_size, mean = x.mean, sd = x.sd), 
            sample_size, simulation_size)

z <- apply(y, 2, median)
var(z)

# Bootstrap no paramétrico
y <- matrix(sample(x, size=sample_size * simulation_size, replace=TRUE), 
            sample_size, simulation_size)

## Resultado equivalente pero coste computacional mucho mayor
# y <- matrix(quantile(x, runif(sample_size * simulation_size)), 
#            sample_size, simulation_size)
z <- apply(y, 2, median)
var(z)

