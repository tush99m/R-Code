
setwd("E:/aa-term-1-18-19/ANALYTICS/test1")

# always good to do this
rm(list=ls())
  
library(MASS)
data(Cars93)
View(Cars93)
names(Cars93)
attach(Cars93)  # so you don't have to type $ signs :) 

# find the pearson correlation between 
# MPG.city and MPG.highway
cor(MPG.city, MPG.highway)  # 0.9439358

# what are the different types of cars in the data 
# and how many of each type are there in the data?
# # Find the mean weight of the cars of each type.
table(Type)
tapply(Weight, Type, mean)

# test the hypothesis that the mean MPG for city driving 
# is 24
t.test(MPG.city, mu=24)
# NO! the mean mpg is not 24!!
# p = 0.006145; xbar=22.37


# restrict to 4 passenger cars (variable: Passengers)
# how many such cars?
# test the hypothesis that the mean highway MPG is 29
cars4p = subset(cars, Passengers=4)
ccnrow(cars4p)
mean(cars4p$MPG.highway)  # 29.08602
t.test(cars4p$MPG.highway, mu=29)
# yes, p = 0.877, xbar = 29.09


# restrict the 4 passenger cars to those whose Price is 
# more than 19
# how many such cars?
# produce a boxplot for the Price for these cars
# test the hypothesis that the mean Price for these cars 
# is 26

cars4p19 = subset(cars4p, Price>19)
nrow(cars4p19)
boxplot(cars3p19)
t.test(cars4p19$Price, mu=26)
# fail to reject: p = 0.221, xbar=27.78


################################################

# 
# Incomes of people in a pouplation are normally distributed 
# with mu = 90 and sigma = 22
# the percentage of people with incomes between 82 and 98 is _______
pnorm(98, 90, 22) - pnorm(82, 90, 22)  # 0.2838704
# 30% of the population has income more than ________
qnorm(0.7, 90, 22)
# 60% of the poulation has income less than ________
qnorm(0.6, 90, 22)
# the percentage of people with income more than 110 is ________
1 - pnorm(110, 90, 22)


# if you did not know the three argument form of pnorm and qnorm
# you could have converted the data to z-scores: ( z = (x-mu)/sigma)
pnorm((98-90)/22) - pnorm((82-90)/22)  # 0.2838704
# etc, etc...





################################################

# Packets of peanuts in a factory are supposed to have a 
# mean weight of 200 gm. To test this, an inspector picks a 
# random sample of 60 packets and finds that the mean weight 
# of a packet in the sample is 195 gm with a standard deviation 
# of 15 gm.
# Do you think that the factory's claim is valid?

# We are testing:
# H0: mu = 200
# H1: mu != 200
# alpha = 0.05



# you could have used any ONE of the following three methods:
# the p-value method (simplest)
(t.calc = (195 - 200)/(15/sqrt(60)))
2*pt(t.calc, 59)   # 0.0123
# is less than 0.05. So reject HO - the factory's claim 
# is not valid!

# second (alternate) method: calculate t.critical:
(t.critical = abs(qt(0.025, 59)))
# but abs(t.calc) > t.critical, so reject H0...

# third (alternate) method: calculate the 95% CI for the 
# true value of mean packet weight based on the sample data.
195 + c(-1, 1)*t.critical*(15/sqrt(60))
# 191.1251 198.8749
# does not contain the H0 value of mu (200)
# so reject H0
################################################

# function to calculate the standard error

se = function(x) {
  print(sd(x)/sqrt(length(x)))
}

se(c(6,7,5,7,4,5,6))  # 0.42056

################################################

















