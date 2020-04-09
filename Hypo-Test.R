

# prob 10) p. 306

calcCI = function(n, mu, sigma, conf) {
  z.cr = abs(qnorm((1 - conf)/2))
  lh = round(mu - z.cr*sigma/sqrt(n), 2) 
  rh = round(mu + z.cr*sigma/sqrt(n), 2)
  cat('The ', conf*100, "% confidence interval is: [", 
      lh, ', ', rh, ']', sep='')
  
}


# HYPOTHESIS TESTING!

# p. 257) prob 12

# H_0: mu = 80
# H_1: mu !=80
# alpha = 0.01

n = 100
sigma = 12


xbars = c(78.5, 77, 75.5, 81)


# method 1: calc CI's
for (xbar in xbars) {
  calcCI(100, xbar, sigma, 0.99)
  cat(end='\n\n')
}
# The 99% confidence interval is: [75.41, 81.59]
# but 80 is inside this interval,
# so fail-to-reject H_0


# method 2: critical values

(z.cr = abs(qnorm(0.005)))

z.calc = (xbars - 80)/(sigma/sqrt(n)) 
z.calc

z.calc = abs(z.calc)

for (i in 1:4) {
  if (z.calc[i] > z.cr) {
    print('Reject H_0')
  } else {
    print("Fail-to-reject H_0")
  }
}

# method 3: calculate p-values


2*pnorm(-z.calc)

#########################

# Prob 17) p. 358

# H_0: mu = 125500

mu = 125500
sigma = 30000
alpha = 0.05


n = 40
xbar = 118000

# method 1:
calcCI(n, xbar, sigma, 0.95)
# fail-to-reject H_0

# method 2:
z.calc = (xbar - mu)/(sigma/sqrt(n))
z.calc

if (abs(z.calc) > abs(qnorm(0.025))) 
  print('Reject H_0') else
  print("Fail to reject H_0")

# method 3:
2*pnorm(z.calc)
# 0.114











