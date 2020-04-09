
calcCI = function(n, xbar, sigma, conf ){
  
  z_cr = qnorm((1-conf)/2)
  lh = round(xbar - z_cr*sigma/sqrt(n),2)
  rh = round(xbar + z_cr*sigma/sqrt(n),2)
  cat ('The confidence interval : [',lh,', ',rh,']', sep = '')
}

calcCI(49,24.8,5,0.95)

calcCI(120, 3.37, 0.28, 0.95)


method2 = function(n, xbar,mu, sigma, conf){
  z_cr = qnorm((1-conf)/2)
  z_calc = (xbar - mu)/(sigma/sqrt(n))
  if (abs(z_calc) > abs(z_cr)) {
    cat('For',xbar,'We Reject H_0')
    } 
    else
    {
      cat('For',xbar,"We Fail to reject H_0")
      }
}

xbars = c(78.5,77,75.5,81)
for(xbar in xbars) {
  method2(100, xbar, 80, 12, 0.99 )
  cat(end='\n\n')
  }

