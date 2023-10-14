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

airbnb <- airbnb %>% rename(neighborhood = neighbourhood)


## 2. Piping practice and creating summary statistics.

neighborhoods <- airbnb %>% select(neighborhood) %>%
  filter(!is.na(neighborhood)) %>%  count(neighborhood) %>%
  arrange(desc(n)) %>% 
  head(20)

airbnb_top_neighborhoods <- airbnb %>% filter(airbnb$neighborhood %in% neighborhoods$neighborhood)

summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% group_by(
  neighborhood) %>% 
  summarize(avg_square_feet = mean(square_feet, na.rm=TRUE),
                              avg_price = mean(price, na.rm=TRUE), 
            sd_price = sd(price, na.rm=TRUE),
            max_price = max(price, na.rm=TRUE), 
            min_price = min(price, na.rm=TRUE) ) %>% arrange(desc(avg_square_feet))
  
highest_avg_square_ft <- summary_stats_top_neighborhoods %>% select(avg_square_feet) %>% slice(1) %>% pull(avg_square_feet)

second_avg_price <- summary_stats_top_neighborhoods %>% select(avg_price) %>% slice(2) %>% pull(avg_price)

