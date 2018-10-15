# Sergio García Prado


rm(list = ls())
datos <- anscombe 


# example(anscombe)
m1 <- lm(y1 ~ x1, data=datos)
summary(m1)
anova(m1)


m2 <- lm(y2 ~ x2, data=datos)
summary(m2)
anova(m2)


m3 <- lm(y3 ~ x3, data=datos)
summary(m3)
anova(m3)


m4 <- lm(y4 ~ x4, data=datos)
summary(m4)
anova(m4)

par(mfrow=c(2, 2))

plot(datos$x1, datos$y1, xlim=c(3.5,20), ylim=c(3, 13))
abline(m1$coef)

plot(datos$x2, datos$y2, xlim=c(3.5,20), ylim=c(3, 13))
abline(m2$coef)

plot(datos$x3, datos$y3, xlim=c(3.5,20), ylim=c(3, 13))
abline(m3$coef)

plot(datos$x4, datos$y4, xlim=c(3.5,20), ylim=c(3, 13))
abline(m4$coef)

#---
par(mfrow=c(1,1))

plot(m4,4)
plot(m3,4)
plot(m2,4)
plot(m1,4)


#############################################################

# Abrir los datos del archvo ozono.txt
# Con los datos del archivo ozono ajustar una recta de regresión de la variable 
# ozono en función de la temperatura.
# Después ajustar una recta sin intercept.
# Realizar un gráfico de dispersión. Añadirle ambas rectas.
# Revisar el resultado de ambos ajustes. 
# ¿Observas algo que te llame la atención si suprimimos el intercept en este modelo lineal?


############################################################

ozono <- read.table("./datasets/ozono.txt", header =TRUE)

head(ozono)

plot(ozono ~ temp, data=ozono)

ozono.model.lm <- lm(ozono ~ temp , data = ozono)
ozono.model.lm.zero.interzept <- lm(ozono ~ 0 + temp , data = ozono)

plot(ozono ~ temp, data=ozono, xlim=c(0, max(temp)), ylim=c(0, max(ozono)))
abline(ozono.model.lm, col = "red")
abline(ozono.model.lm.zero.interzept, col = "blue")

summary(ozono.model.lm)
summary(ozono.model.lm.zero.interzept)

par(mfrow=c(2, 2))
plot(ozono.model.lm)
plot(ozono.model.lm.zero.interzept)
par(mfrow=c(1, 1))

# Ambos modelos (con y sin intercepto proporcionan una distribución de residuos similar), sin embargo,
# tal y como era de esperar, el modelo con intercept variable se ajusta mucho mejor a los datos, lo cual
# se puede ver reflejado en el coeficiente R cuadrado.

ozono.model.lm.squared <- lm(ozono ~ poly(temp, 2) , data = ozono)


new.temp <- data.frame(temp = seq(from = min(ozono$temp), to = max(ozono$temp), length.out = 200))
pred_lm <- predict(ozono.model.lm, newdata = new.temp)
pred_lm2 <- predict(ozono.model.lm.zero.interzept, newdata = new.temp)
pred_lm3 <- predict(ozono.model.lm.squared, newdata = new.temp)

par(mfrow=c(1, 1))
plot(ozono ~ temp, data=ozono)
lines(pred_lm ~ temp, col = "red", data=new.temp, lwd=2)
lines(pred_lm2 ~ temp, col = "blue", data=new.temp, lwd=2)
lines(pred_lm3 ~ temp, col = "green", data=new.temp, lwd=2)

par(mfrow=c(2, 2))
plot(ozono.model.lm.squared)
par(mfrow=c(1, 1))

summary(ozono.model.lm.squared)

# Tal y como se puede apreciar, un modelo basado en regresión cuadrática sobre la variable 
# predictora 'temp' ajusta mejor que un modelo de regresión lineal simple. Esto se puede ver
# a tando a partir de la dispersión de los residuos como del coeficiente R cuadrado.

############################################################
# Ejercicio
#
## Explica el nivel de ozono en función de la temperatura y la velocidad del viento.
## Da la predicción del nivel de ozono para una temperatura de 25ºC y una velocidad del
## viento de 10 km/h, y calcula un IP.

# Para responder a esto podéis seguir las siguientes sugerencias:

# Realizar matriz de gráficos planos  (pairs)

pairs(ozono)

# Ajustar un modelo lineal con temperatura y la velocidad del viento
ozono.model.lm <- lm(ozono ~ temp + viento, data=ozono)
summary(ozono.model.lm)

# Ajustar un modelo lineal que además contenga interacción entre ambas variables

ozono.model.lm.inter <- lm(ozono ~ temp + viento + I(temp, viento), data=ozono)
summary(ozono.model.lm.inter)

# Ajustar un modelo lineal con temperatura y la velocidad del viento junto
# con los cuadrados de ambas variables

ozono.model.lm.quad <- lm(ozono ~ temp + viento + poly(temp, 2) + poly(viento, 2), data=ozono)
summary(ozono.model.lm.quad)

# Ajustar un modelo lineal con temperatura y la velocidad del viento junto con los cuadrados
# de ambas variables y la interacción de las dos variables

ozono.model.lm.quadinter <- lm(ozono ~ temp + viento + poly(temp, 2) + poly(viento, 2) + I(temp, viento), data=ozono)
summary(ozono.model.lm.quadinter)

# Comprobar la normalidad de la variable respuesta

# Transformar la variable respuesta mediante una raíz cúbica, comprobar 
# normalidad y ajustar esta nueva variable con las variables independientes

hist(ozono$ozono ^ (1 / 3))
shapiro.test(ozono$ozono ^ (1 / 3))

############################################################




