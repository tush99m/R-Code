

setwd("E:/aa-term-1-19-20/Semester1")

# Prob 26) p. 279

mu = 939; sigma = 245

# four different sample sizes
n = c(30, 50, 100, 400)

(se = sigma/sqrt(n))

# find the area between xbar=914 and 964

pnorm(964, mu, se) - pnorm(914, mu, se)
# 0.4237704 
# 0.5294211
# 0.6924651 
# 0.9587309


# Prob 28) p. 279
mu.m = 95
mu.f = 106
sigma = 14

n.m = 30; n.f = 45
se.m = sigma/sqrt(n.m); se.f = sigma/sqrt(n.f)

# for males:
pnorm(98, mu.m, se.m) - 
  pnorm(92, mu.m, se.m)

# for females:
pnorm(109, mu.f, se.f) - 
  pnorm(103, mu.f, se.f)

# the prob for females is higher because 
# the sample size is larger for females 
# and therefore the se is smaller


#########################

# prob 2) p. 306
n = 50; sigma = 6; xbar = 32

(z = c(qnorm(0.75), qnorm(0.95), qnorm(0.975), 
      qnorm(0.995)))

for (i in 1:4) {
  print(xbar + c(-1, 1)*z[i]*sigma/sqrt(n), 
        digits=4)
}


# prob 4) p.306

(n = ceiling((2*1.96*15/8)^2))


####

# Applications

# Prob 7) p. 306

(me = 1.96*4000/sqrt(60))

ceiling((1.96*4000/500)^2)


# Prob 8)









































