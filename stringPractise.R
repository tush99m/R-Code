College

clg.row <- rownames(College); clg.row

v<-list(clg.row)

v
class(v)

texas.college = str_match(clg.row, "Texas"); texas.college
summary(texas.college)

texas.college
r=which(texas.college=="Texas")
r

College[r,]

f<-strsplit(clg.row,' ')
tolower(f)

str_count(clg.row, "College")

str_pad("get", width = 10, pad = "0", side = "both")
paddedstring = str_pad("Oslo", width = 10);
paddedstring
str_trim(paddedstring)



