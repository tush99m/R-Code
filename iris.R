mtcars
hist(mtcars$mpg)

sum(mtcars$am == 1)
sum(mtcars$am == 0)

?plot

plot(mtcars$hp, mtcars$wt, main="Rathod", sub="Tushar", xlab = "weight", ylab = "HorsePower")

iris
c<-colnames(iris);c 

list(c)[1]

class(colnames(iris))

colnames(iris)[1] <- 'tush'

iris.vrs <- suiris$Species=='versicolor'; iris.vrs

cols<- colnames(mtcars); cols

for (i in cols) { print (mtcars$i) }

class(mtcars$mpg)

head(mtcars)
sapply(mtcars, class)


attach(mtcars)
newmtc = data.frame(mpg, as.integer(cyl), disp, hp, drat, wt, qsec,
                    as.integer(vs), as.integer(am), gear, carb)
sapply(newmtc, class)


iris[iris$Species == "virginica" & iris$Sepal.Width > 3.5, 1:4]

row.names(iris[iris$Species == "virginica" & iris$Sepal.Width > 3.5, ])
iris

rep(iris$Petal.Length, times=5, each=2)


iris[c(T,F), 1]
