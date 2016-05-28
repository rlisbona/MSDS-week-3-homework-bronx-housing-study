###########################################
# First try at a makefile in R
# Randy Lisbona
###########################################

setwd("C:/R_Working_Dir/week3")
Project.path <- getwd()
Analysis.path <- paste(getwd(), "/Analysis", sep="")
Sourcedata.path <- paste(getwd(), "/Analysis/SourceData", sep="")
EchoToConsoleSetting <- TRUE

Project.path
Analysis.path
Sourcedata.path

###########################################
# initialize
##########################################

require(lubridate)        # added by Randy
require(ggplot2)          # added by Randy
installXLSXsupport(perl ='C:/Perl64/bin/wperl.exe') # added by Randy
require(gdata)
require(plyr) #Added by Monnie McGee

require("magrittr")       # added by Randy
require("dplyr")          # added by Randy
require("scatterplot3d")  # added by Randy
require("graphics")       # added by Randy


##############################################
# Set the file name to open and build the path
#################################################
File.name <- "rollingsales_brooklyn.csv"
File.path <- paste(Sourcedata.path, "/", File.name, sep="")

## You need a perl interpreter to do this on Windows.
## It's automatic in Mac
#bk <- read.xls("rollingsales_brooklyn.xls",pattern="BOROUGH")

# So, save the file as a csv and use read.csv instead

#bk <- read.csv("rollingsales_brooklyn.xls",skip=4,header=TRUE)
bk <- read.csv(File.path,skip=4,header=TRUE) # import rollingsales_brooklyn.csv

###############################################
# Step1 first steps to review the file
################################################

source(paste(Analysis.path,"/","Step1.r", sep = ""), echo = EchoToConsoleSetting)


###############################################
# Step2 clean it up, set variable classes
################################################

source(paste(Analysis.path,"/","Step2.r", sep = ""), echo = EchoToConsoleSetting)


################################################
# Step3  Just look at sales <> 0
################################################

source(paste(Analysis.path,"/","Step3.r", sep = ""), echo = EchoToConsoleSetting)
