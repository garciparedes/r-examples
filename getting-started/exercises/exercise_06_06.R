#
# Title:
#   Ejercicios Computación Estadística - Hoja 6 - Ejercicio 6
#
# Author:
#   Sergio García Prado - garciparedes.me
#
# Date:
#   May 2018
#

library(readxl)

base.path <- './../../datasets/comunidades-autónomas/'

poblacion <- function(name) {
  path <- paste0(base.path, gsub(" ", "-", tolower(name)), ".xls")
  d <- read_xls(path, skip = 11, col_names = FALSE)

  piramide1(d$X__3, d$X__4, 5, 1, 100, name)
  barplot(d$X__2)
}

piramide1 <- function(hombres, mujeres, amplitud, escalax, edadmax, region) {
  max1 <- max(c(hombres,mujeres))
  n <- length(hombres)
  min.x <- -(max1 %/% escalax + 1) * escalax
  max.x <- (max1 %/% escalax + 1) * escalax
  plot(0, 0, type = "n", ylim = c(0, edadmax + 5), xlim = c(min.x, max.x),
       xlab = "", ylab = "")
  ejex1 <- seq(0, max1, by = escalax)
  ejex2 <- -ejex1[order(-ejex1)]
  ejex <- c(ejex2,ejex1)
  ejey <- seq(0,edadmax, by = amplitud)
  for(i in 1:n){
    x1 <- 0 ;
    x2 <- hombres[i];
    x3 <- - mujeres[i]
    y1 <- (i - 1) * amplitud
    y2 <- y1 + amplitud
    rect(x1, y1, x2, y2, col = "red")
    rect(x1, y1, x3, y2, col = "blue")
  }
  x.l1 <- -max1 / 16 - 1.5*escalax
  x.l2 <- max1/16+escalax
  title(main = paste("Pirámide poblaciona", sep="\n", region), ylab = "edad")
  legend(x.l1, edadmax + 5, "mujeres", bty = "n", xjust=1)
  legend(x.l2, edadmax + 5, "hombres", bty = "n")
}

poblacion("castilla y leon")
