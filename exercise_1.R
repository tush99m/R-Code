a = readline("Insert your name ");a
b = readline('insert your age ');b

R.version.string

a1 = c('1','2','3')
b1= 10
c1 = c(1,2,3,45)
ls()
ls.str()

a2 = seq(20,50);a2
a3 = mean(20:22);a3
a4 = sum(10:12);a4
a5 = median(1,2); a5 ##### not working properly
a6 = sample(1:5, 60, replace = TRUE); a6
a7 = sample(1:5); a7

##### Fibonacci series
fib = numeric(10)
fib[1]= fib[2] = 1; fib
for (i in 3:10) {fib[i] = fib[i-2] + fib[i-1]};fib

checkPrime = function(n) 
{
  p = c()
  x = seq(2,n)
  
  for(i in x)
    {
      if (any(x==i))
        {
          p = c(p, i)
          x = c(x[(x %% i) != 0], i)
        }
    }
  return(p) 
}

checkPrime(6)


fizzBuzz = function()
{
  x = seq(1,16)
  for (i in x)
    {
      if (i %% 5==0 & i%%3==0 )      { print ('fizzbuzz') }
      else if (i %% 5 == 0) { print ('buzz') }
      else if (i %% 3 == 0) { print ('fizz') }
      else print(i)
    }
}

fizzBuzz()

head(letters,10)
tail(LETTERS,10)
tail(LETTERS[22:24])

factors = function(n)
{
  print (paste("These are the factors of",n))
  for (i in 1:n)
  {
    if (n%%i==0){print (i)}
  }
}
factors(40)

b2 = seq(1,99);b2
max(b2)
min(b2)


str1 = "The quick brown fox jumps over the lazy fox dog."
print("Original vector(string)")
print(str1)
print("Unique elements of the said vector:")
print(unique(tolower(str1))) ##### not working

nums = c(1, 2, 2, 3, 4, 4, 5, 6)
print("Original vector(number)")
print(nums)
print (length(nums))
print("Unique elements of the said vector:")
print(unique(nums))


v1=c(1,2,3)
v2=c(4,5,6)
v3=c(7,8,9)

m = matrix(c(v1,v2,v3), nrow=3, ncol=3);m
m1=cbind(v1,v2,v3);m1

s1=sample(1:10, 20, replace = TRUE); s1
t = table(s1); t
s2 = rnorm(10, mean = 10, sd = 5); s2
sum(s2)
length(s2)
s3 = runif(10); s3

array1 = array(c(1,2,3,4,5), dim = c(4,3,2), dimnames = list(c('a','b','c','d'))); array1

l = list(c(1, 2, 2, 5, 7, 12),  month.abb, matrix(c(3, -8, 1, -3), nrow = 2),asin);l

#### plots -> plot(x,y)
plot(cars$speed, cars$dist, xlab='Speed', ylab = 'dist', main='Cars Speed', sub='Stopping dist')

plot(cars$speed, cars$dist, xlab='Speed', ylab = 'dist', main='Cars Speed', sub='Stopping dist',xlim=c(0, 20), ylim=c(0, 20) )
?plot

barplot(c(83,46,72,98),xlab='Subject', ylab='marks', names.arg=c('Eng','maths','physics', 'chemistry'), ylim=c(0,100), horiz=F)
?barplot

n = floor(rnorm(10000, 500, 100))
t = table(n)
barplot(t)

f1 = c(1:20); f1
f2 = sum(f1); f2
f3 = mean(f1); f3
f4 = prod(c(1,2,3)); f4

h1= list(c(1,2,3), c('a','b','c'), list(1,2,3,4)); h1

df1 = data.frame(Name = c('tush','akshay','poonam'),
                 age = c(25,22,27)
                 ); df1

summary(df1)
toString(1)
names(df1)
salary = c(88000,75000,60000)
df1$Salary = salary; df1

###### Insert a row in the data frame
df2= data.frame(Name='gopal', age=50, Salary = 125000);df2
df3 = rbind(df1, df2); df3



df3$Name
df3[df3$age >29,]

    