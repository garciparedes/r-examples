### Examen Parcial 2 - Inferencia Estadistica 2
### Sergio García Prado

rm(list = ls())

### Ejercicio 1
###############################################################################

### Ejercicio 1 - Apartado A

observed1 <- c(0.87, 0.20, 0.99, 0.40, 0.39, 0.72, 0.33, 0.88, 0.22, 0.45, 
               0.01, 0.37, 0.59, 0.80, 0.93, 0.54, 0.66, 0.49, 0.73, 0.68)

(n1 <- length(observed1))
#20

## Función de distribución bajo hipótesis nula.
CummulativeH0 <- function(x) {
  ifelse(x < 0, 0, 
  ifelse(1 < x, 1,
  (1 / 3) * x ^ 4 * (5 - 2 * x)))
}

## Por ser una hipótesis simple, podemos utilizar el test de kolgomorov-smirnov
test1 <- ks.test(observed1, CummulativeH0)

(D1 <- test1$statistic)
# 0.4149008

(pvalue1 <- test1$p.value)
# 0.001244618

## Nos vemos obligados a rechazar la hipótesis de que los datos observados 
## pertenezcan a la distribución definida en la hipótesis nula. 


### Ejercicio 1 - Apartado B

alpha <- 0.05

## Para simular la potencia calculamos el promedio sobre la variable indicador
## que toma el valor 1 cuando rechazamos la hipótesis nula, y 0 en cuando la 
## aceptamos.

(power1 <- mean(replicate(1000, ks.test(runif(n1), CummulativeH0)$p.value < alpha)))
# 0.985


### Ejercicio 2
###############################################################################

# Fijamos el número de simulaciones bootstrap.
nsims2 <- 1000


observed2 <- c(2.27,2.28,0.05,0.56,0.59,1.21,0.46,1.74,1.66,0.66,1.94,0.33,
               0.33,0.22,2.16,1.69,0.45,1.13,1.00,1.85,1.28,7.61,0.03,0.86,
               0.66,3.84,1.42,0.80,0.25,5.03,2.23,0.83,4.33,1.35,0.91,0.87,
               0.06,6.80,1.62,0.02,0.05,3.40,0.72,1.58,0.53,0.90,0.35,0.95,
               0.95,0.46)

(n2 <- length(observed2))
# 50

(observed2.mean <- mean(observed2))
# 1.4654

(observed2.sd <- sd(observed2))
# 1.609788

## Generamos una muestra bootstrap paramétrica asumiendo una distribución 
## normal en los datos.
bootstrap.sample <- matrix(rnorm(n = n2 * nsims2, mean = observed2.mean, sd = observed2.sd),
                           nsims2, n2)

bootstrap.mean <- rowMeans(bootstrap.sample)

## Utilizamos el mismo alpha que en el ejercicio anterior (alpha = 0.05)

quantile(bootstrap.mean, c(alpha / 2, 1 - alpha / 2))
# 2.5%     97.5% 
# 1.054534 1.886941


### Ejercicio 3
###############################################################################

observed3 <- c(20, 18, 8, 14)

(k3 <- length(observed3))
# 4

(n3 <- sum(observed3))
# 60 

### Ejercicio 3 - Apartado A


PoissonExcepted <- function(n, k, lambda) {
  ## Método 1
  
  # n * c(dpois(0:(k - 2), lambda = lambda), 
  #       ppois(k - 2, lambda = lambda, lower.tail = FALSE))
  
  ## Método 2:
  
  Probability <- function(x) {
    lambda ^ x * exp(- lambda) / factorial(x)
  }
  
  n * c(Probability(0:(k - 2)), 1 - sum(Probability(0:(k - 2))))
}

NegativeBinomialExcepted <- function(n, k, size, prob) {
  ## Método 1
  
  # n * c(dnbinom(0:(k - 2), size = size, prob = prob), 
  #       pnbinom(k - 2, size = size, prob = prob, lower.tail = FALSE))
  
  ## Método 2:
  
  Probability <- function(x) {
    (x + 1) * prob ^ 2 * (1 - prob) ^ x
  }
  
  n * c(Probability(0:(k - 2)), 1 - sum(Probability(0:(k - 2))))
}

(expected3 <- PoissonExcepted(n3, k3, 1.2))
# 18.071653 21.685983 13.011590  7.230774

(Q3 <- sum((observed3 - expected3) ^ 2 / expected3))
# 9.099696

(pvalue3 <- 1 - pchisq(Q3, k3 - 1))
# 0.02799433

## Nos vemos obligados a rechazar la hipótesis nula (los datos siguen una 
## distribución de Poisson(1.2)) en favor de la alternativa (no pertenecen
## a dicha distribución).

### Ejercicio 3 - Apartado B

(null3 <- PoissonExcepted(n3, k3, 1.2))
# 18.071653 21.685983 13.011590  7.230774

(alternative3 <- NegativeBinomialExcepted(n3, k3, 2, 2 / 3))
# 26.666667 17.777778  8.888889  6.666667

(Q3b <- sum((alternative3 - null3) ^ 2 / null3))
# 6.142462

(power3b <- 1 - pchisq(qchisq(1 - alpha, df = k3 - 1), df = k3 - 1, ncp = Q3b))
# 0.5286654

### Ejercicio 3 - Apartado C

fn <- function(n) {
  null <- PoissonExcepted(n, k3, 1.2)
  alternative <- NegativeBinomialExcepted(n, k3, 2, 2 / 3)
  Q <- sum((alternative - null) ^ 2 / null)
  power <- 1 - pchisq(qchisq(1 - alpha, df = k3 - 1), df = k3 - 1, ncp = Q)
  return(power)
}

(n.exact3 <- uniroot(function(n) {fn(n) - 0.9}, c(1, 1000))$root)
# 138.4281

ceiling(n.exact3)
# 139


## Necesitamos un tamaño muestral de 139 observaciones para poder obtener una 
## potencia == 0.9 en el contraste acerca de si los datos siguen una 
## distribución de Poisson(1.2) cuando realmente pertenecen a una distribución
## BinomialNegativa(2, 2/3)