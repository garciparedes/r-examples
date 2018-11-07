rm(list = ls())
# Sergio García Prado

### Aplicacion del algoritmo IRWLS al ajuste de un modelo logistico 

### La cipermetrina contra el gusano del tabaco

x <- as.integer(c(0, 1, 2, 3, 4, 5))	### dosis de cipermetrina
y <- as.integer(c(1, 5, 17, 23, 33, 36)) ### muertos
n <- as.integer(rep(40, 6))	### numero total en cada grupo

rbind( x, y, n-y, n)

Y <- y/n	### proporcion observada de muertos
X <- cbind(rep(1,6), x )	### Matriz de diseño

# valores de inicio 

beta <- runif(2) # elegimos al azar los parámetros
for (i in 1:3) {
  eta <- c(X %*% beta)
  mu <- exp(eta)/(1+exp(eta))
  nz <- eta + (Y - mu) / (mu * (1 - mu))
  w <- mu * (1 - mu)
  beta <- solve(t(X) %*% diag(w) %*% X) %*% t(X) %*% diag(w) %*% nz
}
beta 
(beta.V <- solve(t(X) %*% diag(w) %*%X))
sqrt(diag(beta.V))


# Para no repetir manualmente, sistematizar para un numero maximo
# de iteraciones y una tolerancia entre dos iteraciones fijada de antemano 

MAX.ITER <- 100

beta <- runif(2)
beta.old <- rep(10, 2)
i <- 0
while (i < MAX.ITER & max(abs(beta - beta.old)) > 10e-3) {
  beta.old <- beta
  
  eta <- c(X %*% beta)
  mu <- exp(eta)/(1+exp(eta))
  nz <- eta + (Y - mu) / (mu * (1 - mu))
  w <- mu * (1 - mu)
  beta <- solve(t(X) %*% diag(w) %*% X) %*% t(X) %*% diag(w) %*% nz
  if (any(is.na(beta))) {
    beta <- runif(2)
  }
  i <- i + 1
}

# Sacar los estimadores "finales" y sus errores estandar, su matriz de var-cov

beta 
(beta.V <- solve(t(X) %*% diag(w) %*%X))
sqrt(diag(beta.V))


# Realizar un grafico de la proporcion de muertes frente a la dosis.
# Añadir la curva logistica ajustada, añadir la recta de regresion

plot(x, Y, pch = 20)
lines(x, mu, col="red")
lines(x, predict(lm(Y ~ x)), col="gray")

# Aplicar la funcion glm de R para hacer el ajuste anterior.

logitmod <- glm(Y ~ x, family = binomial)
summary(logitmod)
