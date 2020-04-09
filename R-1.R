student.df = data.frame( name = c("Sue", "Eva", "Henry", "Jan"),
                         sex = c("f", "f", "m", "m"), 
                         years = c(21,31,29,19)); student.df

student.df$male.teenNew <- ifelse(student.df$sex=="m" & student.df$years<20,"T","F")
student.df

1:10

for (v in 1:length(1:3)) 
  {
    for (k in 1:10)
    {
      print (v+k-1)
    }
  }


set.seed(10)
r<-rnorm(3)
rep(r, times=3)


for (i in mtcars$disp)
{
  if (i>=160)
  {print (i)}
}

for (i in mtcars$disp)
{
  if (i<160)
    break
  print (i)
}

a = c(3,7,NA, 9)
b = c(2,NA,9,3)
f = c(5,2,5,6)
d = c(NA,3,4,NA)

mydf = data.frame(a=a,b=b,f=f,d=d);mydf

mydf[,5] <- ifelse(is.na(mydf[,1]) & !is.na(mydf[,2]), 
                   mydf[,2], 
                   ifelse(is.na(mydf[,2]) & !is.na(mydf[,4]),
                          mydf[,4], mydf[,3]))
mydf


a<-0
while(a<=35)
  {    a=a+1

    if (a==7) next 
    print (a)
}


ex<-list(3,9,13,19,23,29)
a<-0
while(a<36)
{  
  a=a+1
  if (a %in% ex) next
  print (a)
}


