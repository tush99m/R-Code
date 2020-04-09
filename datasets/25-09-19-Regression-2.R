

setwd("E:/aa-term-1-19-20/aa-Semester1")

# an example from the last class:
# file: Advertising.csv

ads = read.csv('datasets/Advertising.csv')

names(ads)

# use TV, Radio, Newspaper as predictors for Sales:

ads.lm1 = lm(Sales~., data=ads)
ads.lm1 = step(ads.lm1)
summary(ads.lm1)

# so, only Radio and TV are (very) good predictors!
# Newspaper is NOT a good predictor!

# But, if we had only used Newspaper as a single predictor:
ads.lm2 = lm(Sales~Newspaper, data=ads)
summary(ads.lm2)

# Now, Newspaper is a good predictor! (p = 0.00115)

# What is the moral of this story?

# look at the correlations...

#################################################














