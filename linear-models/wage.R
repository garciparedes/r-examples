library(ISLR)
library(splines)

# Práctica 5
# En la librería ISLR se encuentran los datos Wage relativos a salarios utilizados en clase. Ver la ayuda para saber que datos contiene Wage.

attach(Wage)
?Wage

# Modelos polinómicos
##

## Ajustar el salario en función de la edad con un polinomio de grado 4 de la 
## edad. poly(age,4) devuelve una matriz cuyas columnas son una base ortogonal 
## de los polinomios. Esto significa que cada columna es una combinación linear 
## ortogonal de las variables age, age2, age3 y age4. Si queremos utilizar 
## directamente estas variables como columnas debemos utilizar 
## poly(age,4,raw=T).

poly(age, 4, raw = TRUE) 

## Realizar el ajuste del polinomio de grado 4 en la edad y comprobar que los 
## valores predichos en los dos ajustes coinciden, pero lógicamente, los 
## coeficientes no.
wage.lm.poly <- lm(wage ~ poly(age, 4))
wage.lm.i <- lm(wage ~ age + I(age^2) + I(age ^ 3) + I(age ^ 4))

# Comprobación de que las predicciones son iguales.
all(predict(wage.lm.poly) - predict(wage.lm.i) < 10e-6)

# Comprobación de qe los coeficientes son diferentes.
wage.lm.poly$coefficients == wage.lm.i$coefficients


## Realizar un gráfico de los datos. Sobreponer el polinomio ajustado y añadir 
## los errores de predicción para distintos valores de la variable edad.

plot(wage ~ age, pch = 20)

## Realizar un ajuste del salario en función de la edad con polinomios de grado 
## 1 a grado 5 y seleccionar el modelo más adecuado entre estos 5 modelos.


models.poly <-  lapply(1:5, function(d) {
  lm(wage ~ poly(age, d))
})

do.call(anova, models.poly)

plot(wage ~ age, pch = 20)
x <- seq(min(age), max(age), length.out = 200)
for (model  in models.poly) {
  lines(x, predict(model, data.frame(age = x)), col = "red")
}

# Modelo constante a trozos
##

## Ajustar el salario en función de la edad utilizando un modelo constante a 
## trozos con la división de la edad en 4 tramos. Representar los datos, los 
## valores ajustados y los errores de predicción.

values <- as.data.frame(cbind(wage, age))[order(age),]

values.splitted <- split(values, rep(1:4, each = nrow(Wage) / 4))

models.piecewise <- lapply(values.splitted, function(df) {
  lm(wage ~ age, df)
})

plot(wage ~ age, pch = 20)
for (model  in models.piecewise) {
  x <- seq(min(model$model$age), max(model$model$age), length.out = 50)
  lines(x, predict(model, data.frame(age = x)), col = "red", lwd = 3)
}

# Modelos basados en splines
##

## Para utilizar modelos con splines necesitamos crear los splines y esto lo 
## podemos hacer con funciones de la librería splines. En esta librerías está la
## función bs() que genera la matriz con las funciones de la base de los splines
## con los nodos que se especifiquen. Por defecto, se generan splines cúbicos.



# Ajustar el salario en función de la edad con splines cúbicos con nodos en las edades 25, 40 y 60.

# Representar los datos. Añadir en este gráfico los valores predichos y un intervalo de predicción para una colección de valores de la edad en el rango de los datos.

# Comprobar la dimensión de la matriz de diseño y de la matriz generado con “bs”. Comprobar el uso del argumento “df” de la función “bs”, ¿qué nodos se consideran?. Nota: ver los atributos del objeto

# Ajustar un modelo para el salario en función de la edad con splines cúbicos naturales con df=4 (ver los nodos considerados)

# Representar los datos. Añadir en este gráfico los valores predichos con el modelo de splines pevio y este modelo de splines naturales.

# Splines suavizados
##

# Ajustar dos modelos de tipo spline suavizado para el salario en función de la edad. Uno de los modelos con 16 grados de libertad y otro eligiendolos por validación cruzada. Utilizar la función smooth.spline()

# Representar estos los datos con los valores predichos por estos dos modelos de splines suavizados

# Regresión local (loess)
## 

# Ajustar el salario en función de la edad con modelos de regresión local con el parámetro de vantana (ó span) 0.2 y 0.5. Utilizar la función loess

# Representar estos los datos con los valores predichos por estos dos modelos de regresión local

# GAMs (Modelos aditivos generalizados)
## 

# Para ajustar modelos aditivos generalizados se puede utilizar la función lm, pero si incluyen términos en splines suavizados o regresiones locales es necesario utilizar la librería gam. Con la función gam() se ajustan todos los términos simultáneamente teniendo en cuenta el resto de términos en el modelo para explicar la respuesta.

# Ajustar un modelo para el salario en función del años con splines cúbicos naturales de 4 grados de libertad y en función de la edad con otro splines cúbicos naturales de grado 5 y en función de la educación, todo ello simultáneamente.

# Ajustar un modelo similar al anterior cambiando los splines splines cúbicos naturales por splines suavizados de los mismos grados de libertad.

# Representar el efecto de cada tipo de componente (componentes de la variable año, de la variable edad y de la variable educación) para los dos modelos anteriores. Utilizar la función plot.Gam().

# Viendo los gráficos se duda sobre si la variable año debe ser excluída, debe ser considerada de forma lineal o si debe incorporarse con un spline suavizado.

# Ajustar los tres modelos anteriores y compararlos