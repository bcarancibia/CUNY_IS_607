#Benjamin Arancibia
#October 6th, 2014
#Week 6 Assignment

#Pull in a website's information using rvest

library(rvest)

#I decided to look at my favorite TV show and extract the cast in it
luther <- html("http://www.imdb.com/title/tt1474684/")

cast <- luther %>%
  html_nodes("#titleCast .itemprop span") %>%
  html_text()
cast


