

setwd("E:/aa-term-1-19-20/Semester1")
setwd("G:\Prerit\Scmhrd\R\datasets")
x = c(4,6,4,5,6,7,3)
y = c(7,13,7,10,12,17,4)

mean(x); mean(y)

var(x); var(y)
sd(x); sd(y)

#############################

# the sample covariance

n = length(x)
xbar = mean(x); ybar = mean(y)
(numerator = sum((x - xbar)*(y - ybar)))
s.xy = numerator/(n-1)

cov(x,y)

# the Pearson corr coeff

s.xy/(sd(x)*sd(y))
cor(x,y)


#######################

auto = read.csv('datasets/auto.csv')
head(auto)

names(auto)

mean(auto$mpg)  # 23.44592
sd(auto$mpg)    # 7.805007

mean(auto$horsepower)  # 104.4694
sd(auto$horsepower)    # 38.49116

cor(auto$mpg, auto$horsepower)  # -0.7784268

##################################

# histograms
hist(auto$mpg, breaks=20, col='red')
hist(auto$horsepower, breaks=20, col='blue')

# see both plots in one graphics window
par(mfrow=c(2,1))
hist(auto$mpg, breaks=20, col='red')
hist(auto$horsepower, breaks=20, col='blue')


# scatterplots
par(mfrow=c(1,1))
plot(auto$horsepower, auto$mpg)
































