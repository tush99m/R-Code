
setwd("E:/aa-term-1-19-20/Semester1")


# Problem 1







# Problem 2

eq = read.csv('datasets/equity.csv')
head(eq)
names(eq)

mean(eq$mktcap)
mean(eq$debt)
sd(eq$mktcap)
sd(eq$debt)


##########################


# Problem 3

hr = read.csv('datasets/house-rents.csv')
names(hr)

hist(hr$age, 
     main='Histogram of house rents',
     xlab='Age in years',
     ylab='Frequency',
     labels=T)




#####################

# Problem 4

# how to read a tab-separated file

cpi = read.table('datasets/1.2.txt',
                 header=T,
                 sep='\t')
View(cpi)

##########################

# working with missing data (NA)

rm(list=ls())

sleep = read.csv('datasets/sleep.csv')
View(sleep)

is.na(sleep)

vec = c(T, F, F, T, T, T)
sum(vec)

sum(is.na(sleep))

#################

# remove all rows with missing values
nrow(sleep)  # 62

sleep2 = na.omit(sleep)
nrow(sleep2)

##########################

# the apply family of functions

# apply
# tapply
# lapply
# sapply
# mapply

View(sleep2)

apply(sleep2, 2, mean)
apply(sleep2, 2, sd)
apply(sleep2, 2, max)

###############################

# tapply

gss = read.csv('datasets/gss-small.csv')
dim(gss)

gss2 = na.omit(gss)
dim(gss2)

# what are the mean years of educ for 
# people with/without anomia

tapply(gss2$educ, gss2$anomia5, mean)

# what are the mean years of educ for
# people who find life dull/routine/exciting

xyz = tapply(gss2$educ, gss2$life, mean)


#########################

# the na.rm option

mean(sleep$NonD)
mean(sleep$NonD, na.rm=T)
sd(sleep$NonD, na.rm=T)

#########################

# the attach command
# DO NOT USE!!!

mean(NonD, na.rm=T)

attach(sleep)
mean(NonD, na.rm=T)
detach(sleep)
ls()


#########################

str(gss2)

# see the levels of a factor
levels(gss2$life)

auto = read.csv('datasets/auto.csv')
names(auto)

#####################

# data conversions
num = "89"
class(num)
# "character"
num = as.numeric(num)
class(num)
#  "numeric"
num.char = as.character(num)
class(num.char)
# "character"

df = data.frame(age=c(34,24,29,21),
                job=c(1,2,2,1))
df
str(df)
df$job = as.factor(df$job)
str(df)

df$job = as.character(df$job)
str(df)

df
tapply(df$age, df$job, mean)

df$job = as.numeric(df$job)
str(df)
tapply(df$age, df$job, mean)


####################

x <- 7  # DO NOT USE!!!
x = 7

67 -> x
x

###################

# tabulating data

gss = read.csv('datasets/gss-small.csv')
names(gss)

attach(gss)

# how many males/females?
table(sex)
table(life)
table(anomia5)

table(sex, life)
table(sex, anomia5)

ftable(anomia5, sex, life)


