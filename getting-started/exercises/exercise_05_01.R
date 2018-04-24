#
# Title:
#   Ejercicios Computación Estadística - Hoja 5 - Ejercicio 1
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

datos <- Cars93


#
# Apartado b)
#

colnames(datos)
# 'Manufacturer' 'Model' 'Type' 'Min.Price' 'Price' 'Max.Price' 'MPG.city'
# 'MPG.highway' 'AirBags' 'DriveTrain' 'Cylinders' 'EngineSize' 'Horsepower'
# 'RPM' 'Rev.per.mile' 'Man.trans.avail' 'Fuel.tank.capacity' 'Passengers'
# 'Length' 'Wheelbase' 'Width' 'Turn.circle' 'Rear.seat.room' 'Luggage.room'
# 'Weight' 'Origin' 'Make'
dim(datos) # 93 27

#
# Apartado c)
#

colSums(sapply(datos, is.na))
# Manufacturer
# 0
# Model
# 0
# Type
# 0
# Min.Price
# 0
# Price
# 0
# Max.Price
# 0
# MPG.city
# 0
# MPG.highway
# 0
# AirBags
# 0
# DriveTrain
# 0
# Cylinders
# 0
# EngineSize
# 0
# Horsepower
# 0
# RPM
# 0
# Rev.per.mile
# 0
# Man.trans.avail
# 0
# Fuel.tank.capacity
# 0
# Passengers
# 0
# Length
# 0
# Wheelbase
# 0
# Width
# 0
# Turn.circle
# 0
# Rear.seat.room
# 2
# Luggage.room
# 11
# Weight
# 0
# Origin
# 0
# Make
# 0


#
# Apartado d)
#

class(datos$Type) # 'factor'
levels(datos$Type) # 'Compact' 'Large' 'Midsize' 'Small' 'Sporty' 'Van'

#
# Apartado e)
#

datos[which.max(datos$Weight),]
#Manufacturer	Model	Type	Min.Price	Price	Max.Price	MPG.city	MPG.highway	AirBags	DriveTrain	⋯	Passengers	Length	Wheelbase	Width	Turn.circle	Rear.seat.room	Luggage.room	Weight	Origin	Make
#8	Buick	Roadmaster	Large	22.6	23.7	24.9	16	25	Driver only	Rear	⋯	6	216	116	78	45	30.5	21	4105	USA	Buick Roadmaster

#
# Apartado f)
#

datos$L100km.higway <- 3.785 / (1.480 * datos$MPG.highway) * 100

#
# Apartado g)
#

consumo.tipo <- aggregate(datos[, "L100km.higway", drop = FALSE],
                          list(datos$Type), mean)
# Group.1	L100km.higway
# Compact	8.635874
# Large	9.588455
# Midsize	9.649925
# Small	7.362620
# Sporty	9.013192
# Van	11.729922


#
# Apartado h)
#

lista.tipo <- split(datos, datos$Type)
names(lista.tipo) # 'Compact' 'Large' 'Midsize' 'Small' 'Sporty' 'Van'



#
# Apartado i)
#

con.max <- apply(lista.tipo$Van[, c("MPG.city", "MPG.highway")], 1, max)


#
# Apartado j)
#

peso.peq <- lista.tipo$Small$Weight


#
# Apartado k)
#

mi.lista <- list("peso" = peso.peq, "consumo" = consumo.tipo)
mi.lista

#
# Apartado l)
#

Cars93$MPG.city[which.max(Cars93$Weight)]

#
# Apartado m)
#

save(lista.tipo, mi.lista, peso.peq, file = "save.Rdata")


#
# Apartado n)
#

table(datos[datos$Origin == "USA", c("AirBags", "Type")])
# Type
# AirBags              Compact Large Midsize Small Sporty Van
#   Driver & Passenger       1     4       2     0      2   0
#   Driver only              2     7       5     2      5   2
#   None                     4     0       3     5      1   3


#
# Apartado ñ)
#


par(mfrow = c(length(levels(datos$Type)),length(levels(datos$Origin))))
for (it in split(datos, list(datos$Type, datos$Origin))) {
  if (nrow(it) > 0) {
    plot(MPG.highway ~ MPG.city, it, pch = 20,
         main = paste(it$Type, " - ", it$Origin)[1])
  }
}


#
# Apartado o)
#

savehistory("history.Rhistory")


#
# Apartado p)
#

pdf("results.pdf")
for (it in split(datos, list(datos$Type, datos$Origin))) {
  if (nrow(it) > 0) {
    plot(MPG.highway ~ MPG.city, it, pch = 20,
         main = paste(it$Type, " - ", it$Origin)[1])
  }
}
dev.off()
