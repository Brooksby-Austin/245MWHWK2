# Austin Brooksby
rm(list=ls()) # clear the environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#-------Import necessary packages here-------------------#
library(tidyverse) # importing a package

#------ Uploading PERMID --------------------------------#
PERMID <- "7216567" #Type your PERMID within the quotation marks
PERMID <- as.numeric(gsub("\\D", "", PERMID)) #Don't touch
set.seed(PERMID) #Don't touch

## tells Git to track all changes in this RStudio Project
usethis::use_git()
## automatically syncs the Rstudio Project with your Github account
usethis::use_github()

#1
airbnb <- read.csv("airbnb_data.csv")
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

summary_stats_top_neighborhoods <- summary_stats_top_neighborhoods %>% rename("avg_square_feet" =  "mean(square_feet, na.rm = TRUE)",
                                                                              "avg_price" = "mean(price, na.rm = TRUE)",
                                                                              "sd_price" = "sd(price, na.rm = TRUE)",
                                                                              "max_price" = "max(price, na.rm = TRUE)",
                                                                              "min_price" = "min(price, na.rm = TRUE)")
summary_stats_top_neighborhoods <- summary_stats_top_neighborhoods %>% arrange(desc(avg_square_feet))
