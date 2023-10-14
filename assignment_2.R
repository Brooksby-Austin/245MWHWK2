# Sofia Olguin
rm(list=ls()) # clear the environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#-------Import necessary packages here-------------------#
# Note: Using other packages than the ones listed below can break the autograder
library(tidyverse) # importing a package

#------ Uploading PERMID --------------------------------#
PERMID <- "8277717" #Type your PERMID within the quotation marks
PERMID <- as.numeric(gsub("\\D", "", PERMID)) #Don't touch
set.seed(PERMID) #Don't touch

#------ Answers -----------------------------------------#

# Part 2: Coding

## 1. Setting up the data.

#------ Uploading Data ----------------------------------#
# Note: - DO NOT use read.csv()
# - DO NOT include filepath inside the quotations, just the .csv file name
# - DO NOT rename the dataset (the .csv file)
airbnb <- read_csv("airbnb_data.csv") 

airbnb <- airbnb %>% rename( , neighborhood = neighbourhood)


## 2. Piping practice and creating summary statistics.

neighborhoods <- airbnb %>%
  filter()


