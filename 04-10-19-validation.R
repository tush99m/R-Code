
setwd("E:/aa-term-1-19-20/aa-Semester1")

rm(list = ls())

auto  =  read.csv('R-testing,datasets/auto.csv')
set.seed(2)
train = sample(392, 196)

########################################################

lm.fit2 = lm(mpg~poly(horsepower,2),
             data = auto, 
             subset = train)

pred  =  predict(lm.fit2, auto)
mean((auto$mpg-pred)[-train]^2)
# 20.43036

lm.fit3 = lm(mpg~poly(horsepower,3),
             data = auto,
             subset = train)

pred  =  predict(lm.fit3, auto)
mean((auto$mpg-pred)[-train]^2)
# 20.38533
######################################################

#################################
# from ISLR
# Leave-One-Out Cross-Validation

# glm() is the same as lm() if the 
# 'family' argument is not specified

glm.fit  =  glm(mpg~horsepower,data = auto)
coef(glm.fit)
lm.fit  =  lm(mpg~horsepower,data = auto)
coef(lm.fit)

library(boot)

glm.fit = glm(mpg~horsepower,data = auto)

# LOOCV: only data and model as arguments
cv.err = cv.glm(auto, glm.fit)
names(cv.err)
cv.err$K
cv.err$delta  # the average MSE

cv.error = rep(0,5)
cv.error
for (i in 1:5) {
  glm.fit = glm(mpg~poly(horsepower,i),data = auto)
  cv.error[i] = cv.glm(auto,
                       glm.fit)$delta[1]
}
cv.error

# k-Fold Cross-Validation

set.seed(17)
cv.error.10 = rep(0,10)
for (i in 1:10) {
  glm.fit = glm(mpg~poly(horsepower,i),data = auto)
  cv.error.10[i] = cv.glm(auto,
                          glm.fit,
                          K = 10)$delta[1]
}
cv.error.10

#########################################
#########################################


rm(list = ls())
enq  =  read.csv("Enquirer.csv")
names(enq)
head(enq)
nrow(enq)
attach(enq)
plot(adc, pass)   # suggests quadratic in adc

enq.lm1  =  glm(pass~adc, data = enq)

library(boot)
enq.cv.err  =  cv.glm(enq, enq.lm1)   # LOOCV
names(enq.cv.err)
enq.cv.err$delta

summary(enq.lm2)

enq.lm2  =  glm(pass~adc+I(adc^2), data = enq)
enq.cv.err  =  cv.glm(enq, enq.lm2)   # LOOCV
enq.cv.err$delta

enq.lm3  =  glm(pass~adc+I(adc^3), data = enq)
enq.cv.err  =  cv.glm(enq, enq.lm3)   # LOOCV
enq.cv.err$delta

# add another predictor
enq.lm4  =  glm(pass~adc+freelunch)
enq.cv.err  =  cv.glm(enq, enq.lm4)   # LOOCV
enq.cv.err$delta

enq.lm4  =  glm(pass~adc+I(adc^2)+freelunch)
enq.cv.err  =  cv.glm(enq, enq.lm4)   # LOOCV
enq.cv.err$delta

#################################

# k-fold Cross Validation

set.seed(100)   # for reproducible results!

enq.lm1  =  glm(pass~adc, data = enq)
enq.cv.err  =  cv.glm(enq, enq.lm1, K = 10)   # 10-fold CV
enq.cv.err$delta

enq.lm2  =  glm(pass~adc+I(adc^2), data = enq)
enq.cv.err  =  cv.glm(enq, enq.lm2, K = 10)   # 10-fold CV
enq.cv.err$delta

enq.lm3  =  glm(pass~adc+I(adc^3), data = enq)
enq.cv.err  =  cv.glm(enq, enq.lm3, K = 10)   # 10-fold CV
enq.cv.err$delta

# add another predictor
enq.lm4  =  glm(pass~adc+freelunch)
enq.cv.err  =  cv.glm(enq, enq.lm4, K = 10)   # 10-fold CV
enq.cv.err$delta

enq.lm4  =  glm(pass~adc+I(adc^2)+freelunch)
enq.cv.err  =  cv.glm(enq, enq.lm4, K = 10)   # 10-fold CV
enq.cv.err$delta






