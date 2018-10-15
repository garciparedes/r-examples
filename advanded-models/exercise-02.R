cp <- c(0.02, 0.06, 0.11, 0.22, 0.56, 1.10) ### concentracion de puromycina
v1 <- c(47, 97, 123, 152, 191, 200) ### velocidad de reaccion bajo cp
v2 <- c(76, 107, 139, 159, 201, 207) ### velocidad de reaccion bajo cp

velocidad <- c(v1, v2)
tip.obs <- rep(c("v1", "v2"), c(6, 6))
datos <- data.frame(cp, velocidad, tip.obs)

lm(velocidad~cp+tip.obs, data=datos)

modelo <- lm(velocidad ~ cp, data=datos)
modelo.residuos <- resid(modelo)

plot(velocidad, modelo.residuos, main="Residuos")
abline(0,0)

par(mfrow = c(1,1 ))
plot(lm(velocidad ~ cp, data=datos), which=c(1,1), ask=FALSE)


lm(velocidad~tip.obs, data=datos)

lm(velocidad~cp+tip.obs, data=datos)
