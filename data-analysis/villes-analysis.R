#
# Project: r-examples (github.com/garciparedes/r-examples)
# Author: Sergio García Prado (garciparedes.me)
# Date: 2017-12
# Title: Principal Component Analysis in Villes Dataset
# Description: This code example tries to emulate the example of "Aprender de 
#   los Datos, El Análisis de Componentes Principales, una aproximación desde
#   el Data Mining" book of "Tomas Aluja" and "Alain Morineau"
#

rm(list = ls())

column.index <- function(data, columns.name) {
  match(columns.name, colnames(data))
}


filter.by.factor <- function(data, columns.name, factor, columns.remove = TRUE) {
  col.index <- column.index(data, columns.name)
  indexer <- is.element(villes[, col.index], factor)
  if (columns.remove) {
    return(data[indexer, - col.index])
  } else {
    return(data[indexer, ])
  }
}

filter.by.columns <- function(data, columns.name, reverse = FALSE) {
  col.index <- column.index(data, columns.name)
  if (reverse){
    col.index <- - col.index
  }
  return(data[, col.index])
}
  
filter.complete <- function(data) {
  data[complete.cases(data),]
}


  
villes <- as.data.frame(read.csv("./datasets/villes.csv"))
summary(villes)

cols <- c("Ciudad", "Región.del.mundo", "Maestro", "Chófer.de.autobús",
          "Mecánico.de.coche", "Obrero.de.la.construcción", "Tornero", 
          "Jefe.de.cocina", "Director.de.fábrica", "Ingeniero", "Cajero.banco",
          "Secretaria.de.dirección", "Dependienta", "Trabajador.textil")

villes.use <- filter.complete(filter.by.columns(filter.by.factor(
  villes, "Año", "edition 1994"), cols))

head(villes.use)
dim(villes.use)

villes.use.pca <- princomp(scale(filter.by.columns(
  villes.use,c("Ciudad", "Región.del.mundo"), reverse = TRUE)))

plot(villes.use.pca$scores[,1:2], pch = 20,
     col = as.numeric(villes.use[, "Región.del.mundo"]) + 1)
text(villes.use.pca$scores[,1:2], cex = 0.7, pos = 3,
     labels = sub("94", "", villes.use[,"Ciudad"]))
legend(2,4.5,levels(villes.use[, "Región.del.mundo"]), pch=20,cex=0.5, col=2:nlevels(villes.use[, "Región.del.mundo"]))

  