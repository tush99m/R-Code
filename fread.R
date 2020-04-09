library(data.table)

df <- fread("1	 China	1,397,010,000	April 22, 2019	18.1%	Official population clock
2	 India	1,346,260,000	April 22, 2019	17.5%	Official population clock
            3	 United States	329,074,000	April 22, 2019	4.27%	Official population clock
            4	 Indonesia	268,074,600	July 1, 2019	3.48%	Official annual projection
            5	 Brazil	209,807,000	April 22, 2019	2.72%	Official population clock
            6	 Pakistan	204,413,000	April 22, 2019	2.65%	Official population clock
            7	 Nigeria	193,392,517	July 1, 2016	2.51%	Official estimate
            8	 Bangladesh	166,425,000	April 22, 2019	2.16%	Official population clock
            9	 Russia	146,793,744	January 1, 2019	1.91%	Official estimate
            10	 Mexico	126,577,691	July 1, 2019	1.64%	Official annual projection", col.names=c('Rank','country','population','date', '%','source'))
df
class(df)

?Foreign
