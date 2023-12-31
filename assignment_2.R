# Austin Brooksby
rm(list=ls()) # clear the environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#-------Import necessary packages here-------------------#
library(tidyverse) # importing a package

#------ Uploading PERMID --------------------------------#
PERMID <- "7216567" #Type your PERMID within the quotation marks
PERMID <- as.numeric(gsub("\\D", "", PERMID)) #Don't touch
set.seed(PERMID) #Don't touch

#1
airbnb <- read_csv("airbnb_data.csv")
airbnb <- airbnb %>% rename("neighborhood" = "neighbourhood")

#2
#a
neighborhoods <- airbnb %>% count(neighborhood) %>% filter(!is.na(neighborhood)) %>% 
  arrange(desc(n)) %>% head(20)

#b
airbnb_top_neighborhoods <- airbnb %>% filter(airbnb$neighborhood %in% 
                                                neighborhoods$neighborhood)

#c
summary_stats_top_neighborhoods <- airbnb_top_neighborhoods %>% group_by(neighborhood) %>% 
  summarize(mean(square_feet, na.rm = TRUE), mean(price, na.rm = TRUE), 
            sd(price, na.rm = TRUE), max(price, na.rm = TRUE), min(price, na.rm = TRUE))

summary_stats_top_neighborhoods <- summary_stats_top_neighborhoods %>% rename(
  "avg_square_feet" =  "mean(square_feet, na.rm = TRUE)", 
  "avg_price" = "mean(price, na.rm = TRUE)",
  "sd_price" = "sd(price, na.rm = TRUE)",
  "max_price" = "max(price, na.rm = TRUE)",
  "min_price" = "min(price, na.rm = TRUE)")

summary_stats_top_neighborhoods <- summary_stats_top_neighborhoods %>% arrange(
  desc(avg_square_feet))

#d
highest_avg_square_ft <- summary_stats_top_neighborhoods["avg_square_feet"] %>% 
  slice(1) %>% pull(avg_square_feet)

#e
second_avg_price <- summary_stats_top_neighborhoods %>% arrange(desc(avg_price))
second_avg_price <- second_avg_price["avg_price"] %>% slice(2) %>% 
  pull(avg_price)
