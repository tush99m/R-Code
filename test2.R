
setwd('E:/aa-term-1-18-19/ANALYTICS-Sem-1/test2')

rm(list=ls())

############################################################

# Question 1 

bl = read.csv("bankloan2.csv")
names(bl)
nrow(bl)	# 850

bl = na.omit(bl)	# need to do this!
# lm and glm handle missing values - they omit them from the 
# analysis, but later, when we want build the confusion matrix,
# we do not want the rows with missing values!

nrow(bl)	# 700

bl.glm = glm(default~., data=bl, family=binomial)
summary(bl.glm)
bl.glm = step(bl.glm)
summary(bl.glm)

table(bl$default)
# 
# for a prediction, we only need the variables in the model.
# Ignore the variables not in the model!
(pred = predict(bl.glm, data.frame(age=45, 
                                  employ=18, 
                                  address=14, 
                                  debtinc=10, 
                                  creddebt=2.5), 
               type="response"))
# gives 0.01822  # the probability of this customer 
#                  defaulting

# using a cutoff of 0.5, this customer will NOT default
round(pred)  # 0

# the confusion matrix:
# get the fitted values:
fitval = bl.glm$fitted.values
length(fitval)
table(bl$default, round(fitval))

 
#      0   1
#  0 476  41
#  1  89  94


# ROC and AUC
library(pROC)
plot.roc(bl$default, fitval)

auc(bl$default, fitval)  # 0.8582

######################################################

# Question 2 (bankloan2.csv)

# using the bl with 700 rows (no NA's)

table(bl$default)	# 183 have defaulted, 517 have not

# restrict to default==0 (not defaulted)

bl = subset(bl, default==0)
dim(bl)

train = 1:300
bl.lm = lm(creddebt~age+employ+address+income+debtinc+othdebt, 
           data=bl, subset=train)
summary(bl.lm)
# need to run step!
bl.lm = step(bl.lm)
summary(bl.lm)
# Good predictors are: othdebt, employ, income, debtinc
predict(bl.lm, data.frame(
  othdebt=4,
  employ=8,
  income=35,
  debtinc=18), interval="prediction")

#      fit       lwr      upr
# 2.293515 0.5922742 3.994755

# now make predictions on the test data
pred = predict(bl.lm, 
               newdata=bl[-train, ]
               )

cor(bl[-train, ]$creddebt, pred)  # 0.7698658

##########################################

bl.test = bl[-train, ]  # for convenience

# Bonus:
# calculate MSE (Mean Squared Error)
# the MSE is sum((y - ycap)^2)
# where y are the actual data and ycap are the predictions
mse = sum((bl.test$creddebt - pred)^2)
mse    # 896.1767


#####################################################










