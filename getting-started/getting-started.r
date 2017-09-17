library(lattice)

print("This is a Getting Started")
x <- 1
print(x)

x1 <- 'a'
print(x)

x2 <- c(1,2,3)
print(x2)

x3 <- c(x2, x2)
print(x3)

x4 <- 1:4
print(x4)

seq(1,4)
seq(1,4, by=2)

x <- 5:10
print(x)
print(x > 7)

x[2] <- 40
sort(x)
print(x)

matrix(c(1,2,3,4,5,6), nrow=2)
matrix(c(1,2,3,4,5,6), nrow=1)
matrix(c(1,2,3,4,5,6), nrow=6)
matrix(c(1,2,3,4,5,6), nrow=6, byrow = T)
matrix(c(1,2,3,4,5,6), nrow=2, byrow = T)

A <- matrix(c(1,2,3,4,5,6), nrow=2, byrow = T)
dimnames(A)

factor(c("alto", "bajo", "medio"))
x <- data.frame(matrix(1:12, ncol=4))
print(x)

list(c(1,2,3), x)
x <- data.frame(matrix(1:12, ncol=4))
print(x)


A <- matrix(c(1,2,3,4,5,6), nrow=2)
print(A)

A <- data.frame(matrix(1:12, ncol=4))
print(A)
apply(A, 1, mean)
print(A)

f <- factor(c(rep("A",2), rep("B",3)))
print(f)

sapply(x,mean)

x <- 1:10
y <- c(rep("A",5), rep("B",5))

split(x,y)

print(x)
print(y)

cut(x,3)

print(A)
print(x)

x <- matrix(c(1:12), nrow=4 )
print(x)

print(A * x)

A <- matrix(c(1:12), nrow=3 )
B <- matrix(c(1:12), nrow=4 )

print(A)
print(B)

S <- t(A) * B
print(S)
S <- A %*% B
print(S)

x <- runif(50,0,4)
y <- runif(50,0,4)

plot(x,y)

y <- runif(50,0,40)
plot(x,y)


y <- runif(50,0,40)
y <- runif(50,0,40)
plot(x,y)

y <- runif(50,0,4)
plot(x,y)
plot(x,y, asp=1)

y <- runif(50,0,40)
plot(x,y, asp=1)

library(MASS)

data("cars")
data("Cars93")
attach(Cars93)
View(Cars93)

plot(MPG.city, Price)
plot(MPG.city, Price, xlab="milles pero gallon", ylab="Price", xlim=c(15,30))
plot(MPG.city, Price, xlab="milles pero gallon", ylab="Price", xlim=c(15,30), pch=20)
plot(MPG.city, Price, xlab="milles pero gallon", ylab="Price", xlim=c(15,30), pch=20, col="blue")

legend("topright", "city", col = "blue", pch=20, cex=0.75)

abline(h=50)
points(20,30)
curve(sin(x), 0,8,add=F)
hist(x)

x <- rnorm(200)
hist(x)
stripchart(x)
pchisq(15,10)
pchisq(15,10) - pchisq(10,10)
rbeta(100,2,3)
curve(pbeta(x,2,3))
curve(pbeta(x,2,3), col="red", 0,1)
qchisq(c(0.25,0.5,0.75),10)
curve(dbeta(x,2,3))

x <- rnorm(10)
y <- rnorm(10)

datosXY <- data.frame(x,y)
dump("datosXY", file="datosXY.R")
rm(datosXY)

source(file = "datosXY.R")
View(datosXY)

x <- 3
if (x < 10 ) {
  print(paste(x, " es menor que 10"))
} else {
  print(paste(x, "es mayor o igual que 10"))
}

i <- 1
while(i < 6 ) {
  print(paste(i, "veces"), i <- i + 1)
}

for( j in 1:5 ) {
  print( paste( j, " veces"))
}

evaluar <- function(z) {
  if(z < 10 )  {
    print(paste(z, " es menor que 10"))
  } else {
    print(paste(z, "es mayor o igual que 10"))
  }
}
evaluar(3)
evaluar(10)
sumar <- function(a, b) {
  return(a + b)
}
sumar(2,3)

x <- 2.5:25
y <- 2*x+3+rnorm(length(x),0,0.2)
plot(x,y)
regressionxy <- lm (y ~ x)
summary(regressionxy)
abline(regressionxy)
plot(regressionxy)
