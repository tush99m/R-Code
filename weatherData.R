chicago = read.csv('WeatherData/Chicago-F.csv', row.names = 1)
chicago

houston = read.csv('WeatherData/Houston-F.csv', row.names = 1)
houston

ny = read.csv('WeatherData/NewYork-F.csv', row.names = 1)
ny

sf = read.csv('WeatherData/SanFrancisco-F.csv', row.names = 1)
sf

# convert to matrix

chicago = as.matrix(chicago)
houston = as.matrix(houston)
ny = as.matrix(ny)
sf = as.matrix(sf)

# put this in list
weather = list(chicago=chicago, houston=houston, ny=ny, sf=sf)
weather

# lapply
nlist = lapply(weather, t); nlist

sf
sf1=rbind(sf, NewRow = 1:12);sf1
#we cn do above
w1 = lapply(weather, rbind, NewRow = 1:12); w1

rowMeans(sf) # same as apply(sf,1,mean)
lapply(weather, rowMeans)

weather
weather[[1]][1,1]
#OR
weather$chicago[1,1]
# we can do this for all components of weather
lapply(weather, '[', 1, 1)
lapply(weather, '[', 1, )
lapply(weather, '[', , 3) # march details

# adding your own functions
lapply(weather, function(x) x[1,])
lapply(weather, function(x) x[,3]) # march data

lapply(weather, function(x) x[1,]-x[2,]) # subtract row 2 from row 1 for each city

lapply(weather, function(x) round((x[1,]-x[2,])*100/x[2,],2))

#######################################################

#sapply

weather
# avghigh for july
lapply(weather, '[', 1, 7) # gives u list
sapply(weather, '[', 1, 7) # gives u named vector

# avghigh for 4th quarter
lapply(weather, '[', 1, c(10,11,12)) # 10:12
sapply(weather, '[', 1, c(10,11,12)) 

# get the average 
lapply(weather, rowMeans)
sapply(weather, rowMeans)
round(sapply(weather, rowMeans),2)

sapply(weather, function(x) round((x[1,]-x[2,])*100/x[2,],2))

# sapply is the modification of lapply
sapply(weather, rowMeans, simplify=FALSE)

#######################################################

# nesting apply functions

apply(sf, 1, max)
lapply(weather, apply, 1, max)
lapply(weather, function(x) apply(x, 1, max))

#######################################################
sf[1,]
which.max(sf[1,])
names(which.max(sf[1,]))

apply(sf, 1, function(x) names(which.max(x)))
sapply(weather, function(y) apply(y, 1, function(x) names(which.max(x)))
)


















