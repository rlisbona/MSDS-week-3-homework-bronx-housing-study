##################################################
# Just look at data where sale price <> 0
##################################################

bk.sale <- bk[bk$sale.price.n!=0,]

str(bk.sale)
head(bk.sale)
summary(bk.sale)


plot(bk.sale$gross.sqft,bk.sale$sale.price.n)
plot(log(bk.sale$gross.sqft),log(bk.sale$sale.price.n))


attach(bk.sale)
plot(tax.class.at.present, sale.price.n)
# scatterplot(x,y,z)
scatterplot3d(sale.date.asyear,gross.sqft,sale.price.n)
scatterplot3d(tax.class.at.present,log(gross.sqft),log(sale.price.n))
detach(bk.sale)


## for now, let's look at 1-, 2-, and 3-family homes
bk.homes <- bk.sale[which(grepl("FAMILY",bk.sale$building.class.category)),]
dim(bk.homes)
plot(log(bk.homes$gross.sqft),log(bk.homes$sale.price.n))
summary(bk.homes[which(bk.homes$sale.price.n<100000),])


## remove outliers that seem like they weren't actual sales
bk.homes$outliers <- (log(bk.homes$sale.price.n) <=5) + 0
bk.homes <- bk.homes[which(bk.homes$outliers==0),]
plot(log(bk.homes$gross.sqft),log(bk.homes$sale.price.n))
