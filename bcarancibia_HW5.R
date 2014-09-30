---
title: "Week 5 Assignment"
author: "Ben Arancibia"
date: "September 30, 2014"
output: html_document
---
#Question 1
#Three questions that I want answer based on the data presented in the assignment are:
#1: What are the total populations for each city so that the proportion for each response can be calculated.
#2: What are the total responses for yes and no in each city
#3 What are the response for yes and response for no in each city
#In order for questions 2 and 3 to be answered, you need the answer for question one.

#Question 2
require(tidyr)
require(dplyr)
require(plyr)


#Create a dataframe to save this data in its current messy state.


response <- c("yes", "no")
edinburgh_young <- c(80100, 35900)
edinburgh_old <- c(143000, 214800)
glasgow_young <- c(99400, 43000)
glasgow_old <- c(150400, 207000)

#Now create a dataframe

df_response <- data.frame("Vote Response" = response, "E16_24" = edinburgh_young,"E25" = edinburgh_old,"G16_24" = glasgow_young,"G25" = glasgow_old)
df_response


#Question 3
#Use the functionality in the *tidyr* package to convert the data frame to be "tidy data".
tidy_df <- df_response %>% gather(key, votecount, E16_24:G25) %>% separate(key, c("city", "agegroup"), 1) 
tidy_df

#Question 4
#Use the *plyr* package to answer the questions asked in number 1

#1: What are the total populations for each city so that the proportion for each response can be calculated.
total_pop <- sum(tidy_df[, "votecount"])
total_pop

#2: What are the total responses for yes and no in each city
city_sum <- plyr::ddply(tidy_df, "city", plyr::summarize, total = sum(votecount), .inform=TRUE)
city_sum

#3 What are the response for yes and response for no in each city
sum_response_city <- plyr::ddply(tidy_df, c("city", "response"), plyr::summarize, sum = sum(votecount), .inform=TRUE)
sum_response_city

#Question 5

#Having gone through the entire process, I would have asked different questions. I would have asked what is the actual proportion of the responses, not just total. 
#I would change the dataframe if I did it again and creating variables out of city and age group. The way I did it now is pretty ugly.
#Changing the way I structured the tidydata would have made it easier to answer the question relating to proportion of yes or no votes.