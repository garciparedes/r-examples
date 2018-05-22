#
# Title:
#   Computación Estadística - Hoja 9 - Ejercicio 4
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#
# URL:
#   https://github.com/garciparedes/r-examples/blob/master/getting-started/exercises/exercises_09/exercise_09_04.R
#

rm(list = ls())


# Para comprobar empíricamente mediante simulación el teorema central del límite
# vamos a generar un número grande de muestras aleatorias simples procedentes de
# una distribución con media (mu) y varianza finita (sigma). Para cada una de
# estas muestras debemos calcular la media muestral y luego el estadístico
#
# Z = sqrt(n) * (X - (mu)) / (sigma) .
#
# Con los valores de Z debemos comprobar si corresponden a un distribución
# normal estándar como dice el teorema central del límite.


Tipify <- function(sample.mean, mu, dev, n) {
  # Calcula el estadístico Tipificado T
  #
  # Args:
  #   sample.mean: media muestral de la variable X.
  #   mu: Media poblacional de la variable X.
  #   dev: Desviación estándar poblacional de la variable X.
  #   n: Número de observaciones en la muestra utilizada para calcular
  #       x.mean de X.
  #
  # Returns:
  #   Tipificación en la normal estándar de la media muestral de la variable X.
  (sample.mean - mu) * sqrt(n) / dev
}

NormalMu <- function(...) {
  # Extrae la Media de una variable Normal.
  #
  # Args:
  #   ...: lista de parámetros.
  #
  # Returns:
  #   Media de una variable Normal.
  list(...)$mean
}

NormalDev <- function(...) {
  # Extrae la Desviación Estándar de una variable Normal.
  #
  # Args:
  #   ...: lista de parámetros.
  #
  # Returns:
  #   Desviación Estándar de una variable Normal.
  list(...)$sd
}

BinomMu <- function(...) {
  # Extrae la Media de una variable Binomial.
  #
  # Args:
  #   ...: lista de parámetros.
  #
  # Returns:
  #   Media de una variable Binomial.
  l <- list(...)
  l$size * l$prob
}

BinomDev <- function(...) {
  # Extrae la Desviación Estándar de una variable Binomial.
  #
  # Args:
  #   ...: lista de parámetros.
  #
  # Returns:
  #   Desviación Estándar de una variable Binomial.
  l <- list(...)
  sqrt(l$size * l$prob * (1 - l$prob))
}

WeibullMu <- function(...) {
  # Extrae la Media de una variable Weibull.
  #
  # Args:
  #   ...: lista de parámetros.
  #
  # Returns:
  #   Media de una variable Weibull.
  l <- list(...)
  l$scale * gamma (1 + 1 / l$shape)
}

WeibullDev <- function(...) {
  # Extrae la Desviación Estándar de una variable Weibull.
  #
  # Args:
  #   ...: lista de parámetros.
  #
  # Returns:
  #   Desviación Estándar de una variable Weibull.
  l <- list(...)
  sqrt(l$scale ^ 2 * ( gamma(1 + 2 / l$shape) - gamma(1 + 1 / l$shape) ^ 2 ))
}

Simulate <- function(B, N, Generator = rnorm, GeneratorMu = NormalMu,
                     GeneratorDev = NormalDev, breaks = 20, ...) {
  # Realiza una simulación para comprobar la convergencia asintótica hacia
  # la distribución Normal Estándar por el TCL.
  #
  # Args:
  #   B: Número de muestras que simular.
  #   N: Tamaño de cada muestra a simular.
  #   Generator: Función de Generación de números aleatorios. Por defecto se
  #       toma el de variables Normales.
  #   GeneratorMu: Función para el cálculo de la media muestral (necesaria para
  #       la tipificación). Por defecto se toma la de variables Normales.
  #   GeneratorDev: Función para el cálculo de la media muestral (necesaria para
  #       la tipificación). Por defecto se toma la de variables Normales.
  #   ...: lista de parámetros opcionales. Aquí se recogen los parámetros de la
  #       distribución a simular (forma, escala, localización, etc.) siguiendo
  #       la definición apropiada de la función `Generator` así como
  #       `GeneratorMu` y `GeneratorDev`.
  #
  # Returns:
  #   Desviación Estándar de una variable Weibull.
  s <- matrix(Generator(B * N, ...),
                     nrow = B, ncol = N)

  mu <- GeneratorMu(...)
  dev <- GeneratorDev(...)

  s.means <- rowMeans(s)
  s.means.tipified <- Tipify(s.means, mu, dev, N)

  hist(s.means.tipified, prob = TRUE, breaks = breaks, cex.main = 0.85,
       xlab="x-variable", col = "lightgray",
       main = paste("Histograma de la media de ", B,
                    "medias muestrales de tamaño", N,
                    "tipificadas. \n X_raya:",
                    round(mean(s.means.tipified), digits = 4),
                    "  S_x:", round(sd(s.means.tipified), digits = 4)))
  curve(dnorm(x), add = TRUE, col = "darkblue",  lwd=2)
}



# Simulación N(20, 2)
Simulate(200, 20, rnorm, NormalMu, NormalDev,
         mean = 20, sd = 2)

# Puesto que la variable sobre la cual se aplica el TCL ya era una variable
# Normal, el ajuste es bueno para valores reducidos tanto de B como de n, ya
# que en este caso la convergencia no es asintótica, sino que es una simple
# transformación de variables. Esto se debe a la propiedad de que la suma de
# Normales es Normal.



# Simulación B(20, 0.03)
Simulate(200, 20, rbinom, BinomMu, BinomDev, breaks = 10,
        size = 20, prob = 0.03)

# En este caso, la aproximación no converge rápidamente hacia la distribución
# Normal, dado que a pesar de que la distribución Binomial se basa en una suma
# de variables de Bernoulli, estas son discretas. Por tanto, en este caso,
# tiene gran importancia el parámetro N, que "suaviza" la distribución de
# medias conforme este aumenta, ya que el rango de posibles valores al
# promediar es mucho mayor. También mejora conforme B aumenta.



# Simulación B(20, 0.8)
Simulate(200, 20, rbinom, BinomMu, BinomDev, breaks = 10,
         size = 20, prob = 0.8)

# Para este caso, ocurre algo similar, sin embargo el ajuste es de menor
# precisión dado que n * p (1 - p) < 5, lo cual es un requisito heurístico que
# se suele tomar para decidir si es posible el ajuste a la Normal. Sin embargo,
# en este caso no es una restricción imprescindible, ya que lo que estudiamos es
# la tipificación de B medias muestrales construidas a partir de N observaciones
# cada una.



# Simulación W(5, 15)
Simulate(2000, 20, rweibull, WeibullMu, WeibullDev, shape = 15, scale = 5)

# Puesto que la distribución de Weibull es continua y está compuesta como suma
# de variables Exponenciales, la aproximación a la normal es buena. Esta mejora
# drásticamente conforme aumenta el parámetro B en la simulación, mientras que
# lo hace mucho más sutílmente cuando aumente el parámetro N.
