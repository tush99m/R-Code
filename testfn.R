add = function(x){
  force(x)
  function(y)
    x+y
}

add2 = lapply(1:10, add)
add2[[1]](10)

dolls = function(x){
  doll = function(xrow){
    mdn = median(xrow)
    devs = abs(xrow-mdn)
    return(which.max(devs))
  }
  return(apply(x,1,doll))
}s
dolls(10)