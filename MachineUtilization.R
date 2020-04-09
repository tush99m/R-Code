mu = read.csv('Machine-Utilization.csv')
names(mu)

#add column to the data frame
mu$Utilization = 1 - mu$Percent.Idle
head(mu,10)
mu$posixTime = as.POSIXct(mu$Timestamp, format = '%d/%m/%Y %H:%M')
str(mu)

# remove TimeStamp column
mu$Timestamp = NULL
head(mu,12)

# rearrange columns 
mu = mu[, c(4,1,2,3)]
head(mu,12)

# filter for RL1
RL1 = mu[mu$Machine=='RL1',]
summary(RL1)

# still can other machines with 0, remove that as well
RL1$Machine = factor(RL1$Machine)
summary(RL1) # now we have only RL1

# create list : list_RL1
mu_stats = c(min(RL1$Utilization, na.rm = T), 
             mean(RL1$Utilization, na.rm = T),
             max(RL1$Utilization, na.rm = T)
             )
mu_stats 

#check if we have util below 90% : T/F
mu_under_90 = length(which(RL1$Utilization <  0.90)) > 0; mu_under_90

list_RL1 = list('RL1', mu_stats, mu_under_90); list_RL1

# name components of list
names(list_RL1)
names(list_RL1) = c('Machine', 'Stats', 'LowThreshold')
list_RL1
# another way to give names 
list_RL1_new = list(Machine='RL1', Stats=mu_stats, LowThreshold=mu_under_90); list_RL1_new

# Extract components of list
list_RL1[1] # list
list_RL1[[1]] # gives the actual item
list_RL1$Machine # give the actual item

list_RL1[[2]][1] #gives 1st item from the vector 'Stats'

# add/delete compoent to list 
list_RL1[4] = 'New Information'; list_RL1

list_RL1_new[40] = 'New Information'; list_RL1_new
# above code wil add NULL components till 40


# add the hours where the utilization is unknown, using '$'
list_RL1$Unknownhours = RL1[is.na(RL1$Utilization), 'posixTime']

# delete 
list_RL1[4] = NULL; list_RL1


# add data frame
list_RL1$Data = RL1; list_RL1
summary(list_RL1)
str(list_RL1)

#subsetting list
list_RL1[1:3]
list_RL1[c(1,4)]
sublist = list_RL1[c('Machine','Stats')]; sublist[[2]][2]

# Build TimeSeries Plot
library(ggplot2)
p = ggplot(data = mu)
myplot =  p + geom_line(aes(x=posixTime, y=Utilization,colour=Machine), size=1.2) +
          facet_grid(Machine~.) +
          geom_hline(yintercept = 0.90, colour='Grey', size=1.2,linetype=3)

list_RL1$Plot = myplot; list_RL1
summary(list_RL1); str(list_RL1)  


















