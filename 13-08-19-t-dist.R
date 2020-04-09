

# the t-distribution

# draw a normal dist; superimpose t-dists


curve(sin(x), -6, 6, col='red', 
      lty=2, lwd=3)
abline(h=0)
abline(h=.5, col='blue')

#####################################################



curve(dnorm(x), -3, 3, col="black", ylab='')
curve(dt(x, df=2), col='red', add=T)
curve(dt(x, df=8), col='green', add=T)
curve(dt(x, df=50), col='blue', add=T)

#########################

calcCI.t = function(n, xbar, sd, conf) {
  t.cr = abs(qt((1 - conf)/2, n-1))
  lh = round(xbar - t.cr*sd/sqrt(n), 2) 
  rh = round(xbar + t.cr*sd/sqrt(n), 2)
  cat('The ', conf*100, "% confidence interval is: [", 
      lh, ', ', rh, ']', sep='')
  
}

#

# Prob: H_0: mu = 100
mu = 110
n = 100;  xbar = 101; sd = 30

# method 1
calcCI.t(n, xbar, sd, 0.95)
# so reject H_0

# method 2
(t = (xbar - mu)/(sd/sqrt(n)))

(t.cr = qt(0.025, n-1))  # -1.984217
# so reject H_0

# method 3

(p = 2*pt(t, n-1))
# < 0.05, so reject H_0

################################

# prob 27, p. 364

mu = 238

# test
# H_0: mu = 238
# H_1: mu != 238
# alpha = 0.05
# ----------------------

n = 100; xbar = 231; s = 80

calcCI.t(n, xbar, s, 0.95)
# [215.13, 246.87]
# so fail to reject H_0

(t = (xbar - mu)/(s/sqrt(n)))
(t.cr = qt(0.025, n-1))
# abs(t) < abs(t.cr), 
# so fail to reject H_0

(p.val = 2*pt(-abs(t), n-1))
# 0.3836918
# p.val > 0.05,
# so so fail to reject H_0

############################

# prob 30, p. 364

mu = 600000

# test
# H_0: mu = 238
# H_1: mu != 238
# alpha = 0.05
# ----------------------

n = 40; xbar = 570000; s = 65000

calcCI.t(n, xbar, s, 0.95)
# [591212, 632788]
# so fail to reject H_0

(t = (xbar - mu)/(s/sqrt(n)))
(t.cr = qt(0.025, n-1))
# abs(t) < abs(t.cr), 
# so fail to reject H_0

(p.val = 2*pt(-abs(t), n-1))
# 0.2500531
# p.val > 0.05,
# so so fail to reject H_0

############################

setwd("E:/aa-term-1-19-20/Semester1")

# using the built-in t.test() function
# we need _data_ for this!

# prob 32, p. 365

uc = read.csv('ASW-data/UsedCars.CSV')
names(uc)
View(uc)

# H_0: mu = 10192
# H_1: mu != 10192
# alpha = 0.05

t.test(uc$Sale.Price, mu=10192)

# p = 0.0319,
# so reject H_0
# yes, the popuation mean for used 
# cars is NOT the same as the national mean

#
############################


ads = read.csv('datasets/Advertising.csv')

# test wether the mean Sales is 18 

t.test(ads$Sales, mu=13.5)

