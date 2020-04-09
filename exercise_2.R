m1 = matrix(1:12,3,4 );m1
a1 = as.vector(m1);a1

v1=c(1,2,3,4,5)
v2=c(6,7,8,9)
a2 = array(c(v1,v2), dim=c(3,3,2));a2

a2[2,,2]
a2[3,3,1]

v3=sample(1:9,24,replace = T);v3
dim(v3) = c(8,3)
v3


#Write a R program to combine three arrays so that the first row of the first array 
#is followed by the first row of the second array and then first row of the third array.
a3 = sample(1:5,9, replace = T)
a4 = sample(6:9,9, replace = T)
a5 = sample(15:25,9, replace = T)
a6 = array()


v3=seq(from = 50, length.out = 15, by = 2)
a7=array(v3, c(3,5,2));a7
