desarrolladores1 <- c(800, 1000, 1200, 1500, 900, 1500, 1100, 800, 850, 900, 1100)
desarrolladores2 <- c(800, 1000, 1200, 1500, 900, 1500, 1100, 800, 850, 900, 8000)

mean(desarrolladores1, na.rm=TRUE)
var(desarrolladores1, na.rm=TRUE)
sd(desarrolladores1, na.rm=TRUE)

mean(desarrolladores2, na.rm=TRUE)
var(desarrolladores2, na.rm=TRUE)
sd(desarrolladores2, na.rm=TRUE)

boxplot(desarrolladores1)
boxplot(desarrolladores2)
