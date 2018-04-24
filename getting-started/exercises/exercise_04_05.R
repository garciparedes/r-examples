#
# Title:
#   Ejercicios Computación Estadística - Hoja 4 - Ejercicio 5
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   April 2018
#


rm(list = ls())

#
# Apartado a)
#

library(MASS)
data(Cars93)

head(Cars93)

pdf("migrafico.pdf")
plot(Cars93$MPG.highway, Cars93$Price, col = "red", pch = 20, xlim =c(20, 50),
     main = "Prices versus MPG", col.main = "green",
     xlab = "Miles per galon", ylab = "Price")
points(Cars93$MPG.city, Cars93$Price, col="blue", pch = 21)
legend(46, 64,legend=c("highway", "city"), col=c("red", "blue"),
       pch=20:21, cex=0.8, box.lty=0)
dev.off()


plot(Cars93$MPG.highway[1:10], Cars93$Price[1:10], col = "red", pch = 20,
     xlim =c(16, 33), xlab = "Miles per galon", ylab = "Price")
text(Cars93$MPG.highway[1:10] - 0.8, Cars93$Price[1:10],
     labels = Cars93$Manufacturer[1:10], cex= 0.7)
points(Cars93$MPG.city[1:10], Cars93$Price[1:10], col="blue", pch = 20)
legend(15.25, 17,legend=c("Highway", "City"), col=c("red", "blue"),
       pch = 20, cex=0.8)
