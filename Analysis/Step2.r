
bk$borough.char <- as.character(bk$borough)
bk$block.char <- as.character(bk$block)
bk$lot.char <- as.character(bk$lot)
bk$zip.code.char <- as.character(bk$zip.code)

bk$gross.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$gross.square.feet))
bk$land.sqft <- as.numeric(gsub("[^[:digit:]]","", bk$land.square.feet))

## Change sale.date to Date format in R - Added mm/dd/YYYY format
bk$sale.date <- as.Date(bk$sale.date,"%m/%d/%Y")
bk$year.built.asnumeric <- as.numeric(as.character(bk$year.built))
bk$sale.date.asyear <- as.character(year(bk$sale.date))
str(bk)


## do a bit of exploration to make sure there's not anything
## weird going on with sale prices

#hist(bk$sale.price.n) # Something weird here
#hist(bk$sale.price.n[bk$sale.price.n>1000])
#hist(bk$gross.sqft[!bk$sale.price.n==0])

# these graphs make no sense, binning doesn't look right, can't figure it out
attach(bk)
  hist(land.square.feet,xlim = c(0,100000))
  hist(sale.price.n, breaks = 10, xlab = "sale.price.n") # Something weird here
  hist(sale.price.n[sale.price.n>1000], breaks = 10, col="green", xlim = c(0,1000000))
  hist(gross.sqft[!sale.price.n==0])
detach(bk)
