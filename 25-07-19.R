




# Introduction to regression models (linear models)
# and:
# WHY do we need probability theory?

###############################################

x = c(4,6,4,5,6,7,3)
y = c(7,13,7,10,12,16,5)

xbar = mean(x); ybar = mean(y)

var(x); var(y)
sx = sd(x); sy = sd(y)
r = cor(x, y)

plot(x, y, pch=16)

# MEMORIZE THESE FORMULAS!
# b1 = r*(sy/sx)
# b0 = ybar - b1*xbar

(b1 = r*(sy/sx))
(b0 = ybar - b1*xbar)


# suppose 
b0 = -3.7; b1 = 2.75

(ycap = b0 + b1*x)  # ycap is what the regr eqn predicts the y will be!

(epsi = y - ycap)
sum(epsi^2)

# epsi (y - ycap) are called the "errors" or "residuals"

##################################


df = data.frame(x = c(4,6,4,5,6,7,3),
                y = c(7,13,7,10,12,16,5))
df

# lm is "linear model"
df.mod = lm(y ~ x, data=df)
df.mod

##########################################################

setwd("E:/aa-term-1-19-20/Semester1")


# the delivery time data
dt = read.csv('datasets/delivery-time.csv')

head(dt)

dt.lm = lm(dtime ~ num_cases + distance,
           data=dt)
dt.lm


##########################

# why do we need probability theory?

# the delivery time grandma data
# gmage is obviously is a useless predictor, 
# but how can we know this?
dt = read.csv('datasets/delivery-time-gma.csv')

head(dt)

dt.lm = lm(dtime ~ num_cases + distance + gma,
           data=dt)
dt.lm

# we will see that the answer lies in something called p-values
# p for probability

#############################

data(mtcars)
View(mtcars)

# Can you guess whic of the mtcars variables are NOT good predictors 
# for predicting mpg?
# Again, probability (p-values) will help us...


################################



























