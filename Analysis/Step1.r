str(bk)
#str(bk2)

summary(bk)
#summary(bk2)

head(bk)
#head(bk2)

# check the classes
lapply(bk,class)

## Check the data
head(bk)
summary(bk)
str(bk) # Very handy function!
glimpse(bk) # compare str() to glimpse()

#bk$borough.character <- as.character(bk$borough)
#bk$block.character <- as.character(bk$block)

glimpse(bk)

## clean/format the data with regular expressions
## More on these later. For now, know that the
## pattern "[^[:digit:]]" refers to members of the variable name that
## start with digits. We use the gsub command to replace them with a blank space.
# We create a new variable that is a "clean' version of sale.price.
# And sale.price.n is numeric, not a factor.

#bk$SALE.PRICE.justdigits <- gsub("[^[:digit:]]","", bk$sale.price)
#bk$SALE.PRICE.character <- as.character(bk$SALE.PRICE.justdigits)
#bk$SALE.PRICE.numeric <- as.numeric(bk$SALE.PRICE.character)
#bk$SALE.PRICE.n1 <- bk$SALE.PRICE %>% gsub("[^[:digit:]]","", '.') %>% as.numeric #%>% < 1000 # %>% ifelse( NA, bk$SALE.PRICE)

bk$SALE.PRICE.n <- as.numeric(gsub("[^[:digit:]]","", bk$SALE.PRICE))
# Count the NA values
count.na <- sum(is.na(bk$SALE.PRICE.n))
count.na

#Filter the saleprice
#bk$SALE.PRICE.N2 <- ifelse(bk$SALE.PRICE.n < 1000, NA ,bk$SALE.PRICE.n)
#count.na2 <- sum(is.na(bk$SALE.PRICE.N2))
#count.na2

names(bk) <- tolower(names(bk)) # make all variable names lower case
glimpse(bk)

