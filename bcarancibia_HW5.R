---
title: "Week 5 Assignment"
author: "Ben Arancibia"
date: "September 30, 2014"
output: html_document
---
#Question 1
#Three questions that I want answer based on the data presented in the assignment are:
#1: What are the total populations for each city so that the proportion for each response can be calculated.
#2: What proportion of the respondents in each city voted yes or no?
#3: What proportion of the respondents in each age group voted yes or no?
#In order for questions 2 and 3 to be answered, you need the answer for question one.

#Question 2
require(tidyr)
require(dplyr)
require(ggplot2)

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





