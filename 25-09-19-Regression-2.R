

# an example from the last class:
# file: Advertising.csv

ads = read.csv('Advertising.csv')

names(ads)

# use TV, Radio, Newspaper as predictors for Sales:

ads.lm1 = lm(Sales~., data=ads)
ads.lm1 = step(ads.lm1)
summary(ads.lm1)
# Multiple R-squared:  0.8972,

# so, only Radio and TV are (very) good predictors!
# Newspaper is NOT a good predictor!

# But, if we had only used Newspaper as a single predictor:
ads.lm2 = lm(Sales~Newspaper, data=ads)
summary(ads.lm2)
#Multiple R-squared:  0.05212
# Now, Newspaper is a good predictor! (p = 0.00115)

# What is the moral of this story?
# Think ahead

# look at the correlations...
cor(ads)
plot(ads)

ads.lm3 = lm(Sales~Newspaper+TV, data=ads)
ads.lm3 = step(ads.lm3)
summary(ads.lm3)
#Multiple R-squared:  0.6458,
#################################################

bos = read.csv('Boston.csv')
names(bos)
bos.lm = lm(medv~., data=bos)
bos.lm = step(bos.lm)
summary(bos.lm)

################################################

# R^2
dt = read.csv('delivery-time-gma.csv')
names(dt)
dt.lm1 = lm(dtime~num_cases+distance, data = dt)
sum1 = summary(dt.lm1)
names(sum1)
sum1$r.squared #0.9595937

dt.lm2 = lm(dtime~., data = dt)
sum2 = summary(dt.lm2)
sum2$r.squared #0.9596084

# Adding predictor will increase the value of R-squared, even if the added predictor 
# is useless predictor
# Hence take a look at Adjusted R-squared

sum1$adj.r.squared #0.9559205
sum2$adj.r.squared #0.9538381

# Adjusted R-squared deflects the actual value of R-squared,
# it is always less than the actual R-squared.

###################
# what is R^2

# R is coefficient of correlation between y and ycap

summary(bos.lm)
# R^2 = 0.7406

ycap = predict(bos.lm, bos)
ycap
cor(bos$medv, ycap)^2

# R^2 is square of a diff between actual response and predictive reponse

###################

# Categorical Data

tr = read.csv('Trucks.csv')
names(tr)
head(tr)
levels(tr$type)

# "Full-Size Pickup" "Small Pickup"     "Sport Utility" 
tr$retailprice = as.numeric(gsub(',', '', tr$retailprice))

tr.lm = lm(resaleval~type+retailprice, data = tr)
tr.lm = step(tr.lm)
summary(tr.lm)

predict(tr.lm, data.frame(type= 'Small Pickup', retailprice=17000))
predict(tr.lm, data.frame(type= 'Full-Size Pickup', retailprice=17000))
predict(tr.lm, data.frame(type= 'Sport Utility', retailprice=17000))

tr.lm2 = lm(resaleval~type, data = tr)
tr.lm2 = step(tr.lm2)
summary(tr.lm2)
# (Intercept)   typeSmall Pickup  typeSport Utility  
# 60.1              -11.3               -1.5 
predict(tr.lm2, data.frame(type= 'Full-Size Pickup', retailprice=17000))
# 60.1 -> intercept becomes the value for Full-Size Pickup

# resaleval for Small pickup is 11.3 less than resaleval for Full size pickup 

######################################

hr = read.csv('house-rents-area.csv')
head(hr)
names(hr)
hr.lm = lm(rentalrates~age+expenses+vac_rate+squarefeet+area, data = hr)
hr.lm = step(hr.lm)
summary(hr.lm)

predict(hr.lm, data.frame(age = 5, expenses = 10, squarefeet=10000, area='C'))

# 95% CI for the regression coefficient.
confint(hr.lm)

predict(hr.lm, data.frame(age = 5, expenses = 10, squarefeet=10000, area='C'),
          interval = 'prediction',
        level = 0.95)
#    fit      lwr      upr
#  13.14723 11.52332 14.77114

hr.lm2 = lm(rentalrates~age+expenses+vac_rate+squarefeet, data = hr)
hr.lm2 = step(hr.lm2)
summary(hr.lm2)

######################################

# what is the most important predictor?
summary(hr.lm2)

# to find the relative importance of data, we scale the data.
hr1 = read.csv('house-rents-area.csv')
head(hr_new)
hr_new = data.frame(hr1$rentalrates, hr1$age, hr1$expenses, hr1$vac_rate, hr1$squarefeet)
names(hr_new)

hr_new1 = scale(hr_new)
hr_new2 = as.data.frame(hr_new1)
hr1.lm.s = lm(hr1.rentalrates~., data = hr_new1)
hr1.lm.s = step(hr1.lm.s)
summary(hr1.lm.s)

######################################

auto1 = read.csv('auto.csv')
names(auto1)
auto1 = auto1[ , -c(1, 8:10)]
auto1.s = as.data.frame(scale(auto1))
auto1.lm = lm(mpg~., data = auto1.s)
n = nrow(auto1.s)
auto1.lm = step(auto1.lm, k=log(n))
summary(auto1.lm)







































