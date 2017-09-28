#
# University: Universidad de Valladolid
# Degree: Grado en Estadística
# Subject: Análisis de Datos
# Year: 2017/18
# Teacher: Miguel Alejandro Fernández Temprano
# Author: Sergio García Prado (garciparedes.me)
# Name: Práctica 03
#
#

Total <- read.csv('./../../../datasets/olympic-2016-v2.txt', header=TRUE)
A <- Total[, 1:10]

pca1=prcomp(A, scale=TRUE)

print(pca1$sdev^2)
print(pca1$rotation)
print(pca1$x)

print(diag((t(pca1$x) %*% pca1$x)/(nrow(A)-1)))
screeplot(pca1)
biplot(pca1)
library(ggplot2)

scores = as.data.frame(pca1$x)

ggplot(data = scores, aes(x=PC1, y=PC2, label=Total$atleta)) +
  geom_hline(yintercept = 0, colour = "gray65") +
  geom_vline(xintercept = 0, colour = "gray65") +
  geom_text(colour = "tomato", alpha = 0.8, size = 4) +
  ggtitle("ACP Gráfico de los atletas")

# Función para crear un círculo
circle <- function(center = c(0, 0), npoints = 100) {
    r = 1
    tt = seq(0, 2 * pi, length = npoints)
    xx = center[1] + r * cos(tt)
    yy = center[1] + r * sin(tt)
    return(data.frame(x = xx, y = yy))
}
corcir = circle(c(0, 0), npoints = 100)

correlaciones = as.data.frame(cor(A, pca1$x))

arrows = data.frame(x1 = c(rep(0,ncol(A))), y1 = c(rep(0,ncol(A))), x2 = correlaciones$PC1,
    y2 = correlaciones$PC2)

ggplot() + geom_path(data = corcir, aes(x = x, y = y), colour = "gray65") +
    geom_segment(data = arrows, aes(x = x1, y = y1, xend = x2, yend = y2), colour = "gray65") +
    geom_text(data = correlaciones, aes(x = PC1, y = PC2, label = rownames(correlaciones))) +
    geom_hline(yintercept = 0, colour = "gray65") + geom_vline(xintercept = 0,
    colour = "gray65") + xlim(-1.1, 1.1) + ylim(-1.1, 1.1) + labs(x = "eje pc1",
    y = "eje pc2") + ggtitle("Círculo de correlaciones")

library(FactoMineR)

pca3=PCA(A)
pca3

library(ade4)


pca4 = dudi.pca(A)
