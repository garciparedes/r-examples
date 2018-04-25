#
# Title:
#   Ejercicios Computación Estadística - Hoja 3 - Ejercicio 2
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

(gallinas <- source("./../../datasets/gallinas.R")$value)
# provincia	agno	tipo	cabezas	hue.ave	docenas
# Avila	1999	selectas	125.0	285	2969
# Avila	2000	selectas	146.0	285	3477
# Burgos	1999	selectas	1463.0	250	30479
# Burgos	2000	selectas	1465.0	250	30520
# Leon	1999	selectas	109.0	252	2289
# ...


#
# Apartado b)
#

typeof(gallinas) # 'list'


#
# Apartado c)
#

lapply(gallinas, typeof)
# $provincia
# 'integer'
# $agno
# 'integer'
# $tipo
# 'integer'
# $cabezas
# 'double'
# $hue.ave
# 'double'
# $docenas
# 'double'

#
# Apartado d)
#

(d <- gallinas[gallinas$provincia == "Valladolid" & gallinas$agno == 1999, ])
# provincia	agno	tipo	cabezas	hue.ave	docenas
# 15	Valladolid	1999	selectas	3652	265	80654
# 33	Valladolid	1999	camperas	28	150	350

#
# Apartado e)
#

(e <- aggregate(hue.ave ~ agno, gallinas, mean))
# agno	hue.ave
# 1999	212
# 2000	215


#
# Apartado f)
#
(f <- aggregate(docenas ~ agno +  provincia, gallinas, sum))
f[which.max(f$docenas), ]
# agno	provincia	docenas
# 15	1999	Valladolid	81004

#
# Apartado g)
#

save(d, e, f, file = "saved.Rdata" )

#
# Apartado h)
#
rm(list = ls())
e1 = new.env()
load("saved.Rdata", envir = e1)
l = as.list(e1)

#
# Apartado i)
#

GA <- as.matrix(gallinas)
dim(GA) # 36 6

#
# Apartado j)
#
j <- split(gallinas, gallinas$agno)

typeof(j) # 'list'
lapply(j, typeof)
# $`1999`
# 'list'
# $`2000`
# 'list'
