repetitions = 1000
urn = c(1:100)
trailsT0100<-0

for (i in 1:repetitions)
  {
    num <- 0 # the sampled number 
    trials <- 0
    while(num != 55)
      { # we want number 55 
        num <-sample(urn, 1, F) # sampling of the urn
        trials <- trials + 1 # looping the trials until we get the desired output
      }
    trailsT0100 <- trailT0100 + trials # updating the number of trials
}

trailsT0100/repetitions
