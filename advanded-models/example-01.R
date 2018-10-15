attach(cars) 

plot(dist ~ speed)

ajuste.lm <-lm (dist ~ speed)

print(ajuste.lm)
class(ajuste.lm)
is.list(ajuste.lm)
names(ajuste.lm)
summary(ajuste.lm)

formula(ajuste.lm)
model.frame(ajuste.lm )
model.matrix(ajuste.lm )

coefficients(ajuste.lm)
residuals(ajuste.lm)
fitted(ajuste.lm) 
anova(ajuste.lm)

influence.measures(ajuste.lm)
summary(influence.measures(ajuste.lm))

nuevo <- data.frame(speed = c(10,12)) 
predict(ajuste.lm , nuevo, interval="prediction") 
par(mfrow=c(2,2))
plot(ajuste.lm)
