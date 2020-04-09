head(fin, 10)

fin$Revenue<- gsub('$', '',fin$Revenue); head(fin,10)
head(fin,10)
fin$Expenses<- gsub(',', '', fin$Expenses); head(fin)

fin$Revenue <- gsub('$', '', fin$Revenue); head(fin)

fin$Growth <- gsub(',', '', fin$Growth); head(fin, 10)

head(fin, 24)

fin[!complete.cases(fin),]

fin <- read.csv('Future-500.csv', na.strings = c(""))

head(fin, 10)

fin[fin$Profit == 8553827,]

fin_bckp<- fin
fin[which(fin$Profit == 8553827),]

fin<-fin[!is.na(fin$Industry),]

fin[!complete.cases(fin),]

nrow(fin)
rownames(fin)<-NULL
head(fin,18)

fin[is.na(fin$State) & fin$City == 'New York', 'State']<- 'NY'

fin[is.na(fin$State) & fin$City == 'San Francisco', 'State']<- 'CA'

fin[is.na(fin$State)]

m<-median(fin[fin$Industry == 'Financial Services', 'Employees'], na.rm = TRUE);m

fin[is.na(fin$Employees) & fin$Industry == 'Financial Services', 'Employees'] <- m

fin[is.na(fin$Employees),]


fin[c(3,330),]

getwd()

