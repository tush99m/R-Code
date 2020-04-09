
setwd("E:/aa-term-1-19-20/aa-Semester1")

# Prob 11, p. 314

# a)
1 - pt(2.12, 16)
# 0.02499546

# b)
pt(1.337, 16)
# 0.9000388

# c) 
pt(-1.746, 16)
# 0.04998962

############################

# prob 12, p.314

# a)
qt(1 - 0.025, 12)
# 2.178813

# d)

qt(0.05, 25)
# -1.708141 and 1.708141

############################

# Prob 14, p. 314

# a)
# the 90% CI is
lh = 22.5 + qt(.05, 53)*4.4/sqrt(54)
rh = 22.5 - qt(.05, 53)*4.4/sqrt(54)
lh; rh

# 21.4976 to 23.5024

############################

# Prob 19, p.315

# margin of error = t.critical*se

(t.critical = -qt(0.025, 599))
# 1.963932

# so
m.e = t.critical*175/sqrt(600)
m.e
# 14.03101

# the previous year, the mean was 632
# 95% CI for the mean this year is

649 + c(-1, 1)*m.e
# 634.969 663.031

# but 632 does not lie in this interval!
# so there has been a sig. change in  
# the mean expenditure.

#-------------------------------

# revision
# prob 14, p. 357

calcCI = function(n, xbar, sigma, conf) {
  z.cr = abs(qnorm((1 - conf)/2))
  lh = round(xbar - z.cr*sigma/sqrt(n), 2) 
  rh = round(xbar + z.cr*sigma/sqrt(n), 2)
  cat('The ', conf*100, "% confidence interval is: [", 
      lh, ', ', rh, ']', sep='')
  
}

# H_0: mu = 22
n = 75; sigma = 10; conf = 0.99

xbar = 25.1

# CI method
calcCI(n, xbar, sigma, conf)
# [22.13, 28.07] 
# so, reject H_0

# t.critical method
(z.cr = qnorm(0.005))
# -2.575829

# calc. z:
(z = (xbar - 22)/(sigma/sqrt(n)))
# 2.684679

# abs(z) > abs(z.cr)
# so, fail to reject H_0

# p-value method
2*pnorm(-abs(z))
# 0.007259955
# greater than 0.01,
# so, fail to reject H_0

###################################

# the subset() function

# the subset() function allows us to 
# select specified rows and cols of data
# in a dataframe
rm(list=ls())
ls()

data(CO2)
ls()
View(CO2)

# select rows where conc > 200
co2.1 = subset(CO2, conc>200)
nrow(co2.1)
View(co2.1)
summary(co2.1$conc)

# select rows satisfying some condition 
# 
co2.2 = subset(CO2, conc>200 & conc<500)
dim(co2.2)

co2.3 = subset(CO2, (conc>200) & (uptake>40))
dim(co2.3)

co2.4 = subset(CO2, Plant!='Qn2')
dim(co2.4)

co2.5 = subset(CO2, (Plant!='Qn2') & (uptake<55))
dim(co2.5)

###########

names(CO2)

# select cols  

co2.6 = subset(CO2, select=uptake)
head(co2.6)

co2.7 = subset(CO2, select=c(uptake,conc))
head(co2.7)

##################

# select rows and cols

co2.8 = subset(CO2, Plant='Qn2',
               select=c(uptake,conc))

dim(co2.8)
head(co2.8)

###########################

# the table() function:
table(CO2$Plant, CO2$Type)

###########################

# Boxplots

boxplot(CO2$uptake)

table(CO2$Treatment)

# how do the uptakes compare for 
# chilled and nonchilled Treaments?

boxplot(CO2$uptake~CO2$Treatment)

levels(CO2$Plant)

boxplot(CO2$uptake~CO2$Plant)












