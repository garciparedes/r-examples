# Calcio

rm(list = ls())

calcio <- read.table("datasets/calcio.txt", header = TRUE)

head(calcio, 5)
pairs(calcio)



null.value <- mean(calcio$cal)

## Ajustar el “full model” (medias de los nueve grupos)
full.levels <- unique(calcio$minut)
full.values <- tapply(calcio$cal, calcio$minut, mean)
full.sd <- sd(calcio$cal - rep(full.values, each=3))

plot(calcio$minut,calcio$cal, pch=19)
lines(full.levels, full.values)
abline(h=null.value)

mm0 <- lm(cal ~ 1, data = calcio)
summary(mm0)

mm1 <- lm(cal ~ minut, data = calcio)
summary(mm1)

mm2 <- lm(cal ~ poly(minut, 2), data = calcio)
summary(mm2)

plot(calcio$minut,calcio$cal, pch=19)
lines(calcio$minut, predict(mm0), col = "green")
lines(calcio$minut, predict(mm1), col = "blue")
lines(calcio$minut, predict(mm2), col = "red")

## Utilizar anova para realizar el test de falta de ajuste de mm2
anova(mm2)


## Probar modelo Exponencial
init <- list(b0=4, b1=4.3)
mmexp <- nls(cal ~ b0 * (1 - exp(-minut / b1)),  start = init, 
             data=calcio,  algorithm="port", lower=c(-Inf,10e-4), trace = TRUE)

summary(mmexp)
alpha <- 0.95

b0.var <- vcov(mmexp)[1, 1]
b1.var <- vcov(mmexp)[2, 2]

b0 <- coef(mmexp)[1]
b1 <- coef(mmexp)[2]

b0 + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(b0.var)
b1 + c(-1, 1) * qnorm(1 - alpha / 2) * sqrt(b1.var)

## Realizar un gáfico de dispersión con los tres modelos: full, polinomio de orden 2 y modelo exponencial.

plot(calcio$minut,calcio$cal, pch=19)
lines(full.levels, full.values)
lines(calcio$minut, predict(mm2), col = "red")
lines(calcio$minut, predict(mmexp), col = "blue")

## Calcular los errores estándar de los estimadores de los parámetros b0 y b1.
out <- summary(mmexp)
b <- out$coefficients[, 1]
b.errors <- out$coefficients[, 2]

## Calcular IC’s de WALD del 95% para β0 y β1
alpha <- 0.05

### IC para b0
b[1] + c(-1, 1) * b.errors[1] * qnorm(1 - alpha / 2)

### IC para b1
b[2] + c(-1, 1) * b.errors[2] * qnorm(1 - alpha / 2)

## Residuos tras el ajuste del modelo exponencial
sd(calcio$cal - predict(mmexp))
sd(residuals(mmexp))


## Comparación del modelo exponencial con el full saturado
AIC(mmexp)

mm.full <- lm(cal ~ factor(minut), data = calcio)
AIC(mm.full)

logLik(mm1)
logLik(mm1)
logLik(mmexp)
logLik(mm.full)
