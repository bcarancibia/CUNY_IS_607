#Discussion Post
#Pulling in an API

#go to reddit in order to find their api at this page: http://www.reddit.com/dev/api
#I used their API to look at the popularity of subreddits

require(rjson)

url <- "http://www.reddit.com/r/datascience/about.json"
rawdat <- fromJSON(readLines(url, warn = FALSE))

rawdat

#let's take a look at the description
rawdat$data$description

