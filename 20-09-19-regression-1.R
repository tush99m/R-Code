

# Quick revision of the one-sample t-test
##-----------------------------------------------

# Read in the data from the file "Credit.csv"
cr = read.csv('Credit.csv')

# What are the names of the columns in the dataset?
colnames(cr)

# What are the mean and sd of the variable "Balance"?
m=mean(cr$Balance); s=sd(cr$Balance)

# Test the hypothesis that the mean Balance is 540
t.test(cr$Balance, mu = 540)
#p_value = 0.3852
# so fail-to-reject H_0

###########################################################


# Read in the data from the file "Enquirer.csv"
en = read.csv('Enquirer.csv')

# What are the mean and sd of the variable "medincome"?
m1 = mean(en$medincome); m1
s1 = sd(en$medincome); s1

# Plot a histogram of medincome
hist(en$medincome, breaks = 20)

# Test the hypothesis that the mean medincome is 24700
t.test(en$medincome, mu=24700)
# p-value = 0.008348
# reject H_0

##########################################################


# Regression Models...

x = c(3,4,3,5,6)
y = c(9,11,8,14,16)

mod = lm(y~x); mod
# ycap = 0.8529 + 2.5588(x)

#predict if x = 4

predict(mod, data.frame(x=4))

x_vals = data.frame(x=c(3.3,4.7,5,7.7))
predict(mod, x_vals)

#####################

auto = read.csv('auto.csv')
names(auto)

auto = auto[ ,-1]; names(auto)

auto_lm = lm(mpg~., data=auto); auto_lm

plot(auto$horsepower, auto$mpg)

summary(auto_lm)

###########################

dt_gma = read.csv('delivery-time.csv')
names(dt_gma)
dt_lm = lm(dtime ~ num_cases+distance, data=dt_gma)
summary(dt_gma)
############################


auto = auto[ , -c(7,8,9)]
names(auto)
auto_lm2 = lm(auto$mpg~., data = auto); auto_lm2

summary(auto_lm2)

auto_lm3 = lm(mpg~cylinders+horsepower+weight+acceleration, data = auto); summary(auto_lm3)

auto_lm4 = lm(mpg~cylinders+horsepower+weight, data = auto); summary(auto_lm4)

auto_lm5 = lm(mpg~horsepower+weight, data = auto); summary(auto_lm5)

# predict the mpg for hp=200 and weight=4000
predict(auto_lm5, data.frame(horsepower = 200, weight = 4000))

multi_vals = data.frame(horsepower = c(150,200,220), weight = c(2000,4000,3500))
predict(auto_lm5, multi_vals)


auto_lm = lm(mpg~., data = auto); summary(auto_lm)
auto_lm_final = step(auto_lm)
summary(auto_lm_final)

##################
# predict delivery time num_cases = 20 and dist=400

dt = read.csv('delivery-time.csv')
names(dt)
dt_lm = step(lm(dtime~., data=dt))
predict(dt_lm, data.frame(num_cases=20, distance=400))

# advertising.csv => predict sales if tv=100, radio=20, newspaper = 50
ad = read.csv('Advertising.csv')
names(ad)
ad_lm = step(lm(Sales~., data=ad))
predict(ad_lm, data.frame(TV=100, Radio=20))





















