5+5

a <- 5+5

2 + 3 * 5

log((1+2+3)/4)
pi

# Generar secuencias, repeticiones y aleatorios

1:10
seq(from=0, to=20, by=5)
seq(from=5, by=5, length.out=10)
rep(x=3, times='10')
runif(n=100, min=1, max=5)

rnorm(n=100, mean=100, sd=10)

# Vectores

x <- 1
is.vector(x)

x <- c(1, 2, 3, 4, 5)
x <- c(1:10)
x
a <- c('a', 'b')
a
y <- c(x, 'abc', a)
y
z <- c(x, 2, 3, x)

rep(a, times=5)
a[[1]] = 'd'
a

rep(a, each=5)

x <- c(1, 10, 20, 5, 24)
y <- c(10, 3, 2, 4, 1)
x + 3*y - 1

# Dataframes 

nombre <- c('Guillermo', 'Andrea', 'Mario', 'Dustin')
edad <- c(40, 24, 22, 22)
apellido <- c('Pizarro', 'Cardenas', 'Orrala', 'Quinde')
ciudad <- c(rep('Guayaquil', times=4))

df_1 <- data.frame(nombre, apellido, edad, ciudad)
df_1

df_2 <- data.frame(a=nombre, b=apellido, c=edad, d=ciudad)
df_2

ciudad <- c('GYE', 'UIO', 'GYE', 'CUE')

df_3 <- data.frame(nombre, apellido, edad, ciudad=factor(ciudad))
df_3

rownames(df_3)

length(df_3)

rownames(df_3) <- paste('id_', 1:4, sep = '')
df_3

rownames(df_3) <- paste('id_', 1:length(df_3), sep = '')
df_3

names(df_2)
df_2

names(df_2) <- c('nombre', 'apellido', 'edad', 'ciudad')
df_2

head(df_2, n=2)

tail(df_2, n=2)

str(df_2)

nombre <- c('Guillermo', 'Andrea', 'Mario', 'Dustin')
edad <- c(40, 24)

df_4 <- data.frame(nombre, edad)

## Listas

list(1, c(2, 3), df_1)

lista <- list(A=1, B=c(2, 3), C=df_1)
lista$C





