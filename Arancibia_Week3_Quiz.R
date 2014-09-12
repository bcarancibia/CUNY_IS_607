####Ben Arancibia####
####Week 3 Quiz####

#####Question 1#####
obser_mean <- function(vector){
  if(is.numeric(vector) == FALSE)
    return ("This is not a vector")
  else
    return (mean(vector))
}

####Question 2####
obser_mean <- function(vector){
  if(is.numeric(vector) == FALSE)
    return ("This is not a vector")
  else
    return (mean(vector, na.rm = TRUE))
}

####Question 3####
gcdiv <- function(x,y) {
  r <- x%%y;
  return(ifelse(r, gcdiv(y, r), y))
}

gcdiv(c(590, 10), c(45, 9))

####Question 4####
euclid_alg <- function(x,y) {
  r <- x%%y;
  return(ifelse(r, euclid_alg(y, r), y))
}

euclid_alg(c(590, 10), c(45, 9))

####Question 5####
two_inputs <- function(x, y) {
  return ((x*x*y) + (2*x*y) - (x*y*y))
}

####Question 6####
setwd("/users/bcarancibia/CUNY_IS_607")
price <- read.table("week-3-price-data.csv", header = TRUE, sep = ",")
make_model <- read.table("week-3-make-model-data.csv", header = TRUE, sep = ",")
prc_mk_mdl <- merge(x = price, y = make_model, by.x = "ModelNumber", by.y = "ModelNumber")

####Question 7####
setwd("/users/bcarancibia/CUNY_IS_607")
price <- read.table("week-3-price-data.csv", header = TRUE, sep = ",")
make_model <- read.table("week-3-make-model-data.csv", header = TRUE, sep = ",")
prc_mk_mdl_ALL <- merge(x = price, y = make_model, by.x = "ModelNumber", by.y = "ModelNumber", all = TRUE)

####Question 8####
vehicles_2010 <- subset(prc_mk_mdl_ALL, Year == 2010)
head(vehicles_2010)

####Question 9####
red_vehicles_2010 <- subset(prc_mk_mdl_ALL, Color == "Red" & Price > 10000)
head(red_vehicles_2010)

####Question 10####
vehicles_removed <- red_vehicles_2010 [,!(names(red_vehicles_2010) %in% c("ModelNumber", "Color"))]
head(vehicles_removed)

####Question 11####
elements_in_char <- function(char_vector){
  num.chars <- nchar(char_vector)
  return(num.chars)
}

####Question 12####
char_concat <- function(one, two) {
  if (length(one) != length(two)) {
    return("Needs to be same length, please!")
  }
  else
  return(mapply(paste, one, two, sep = " "))
}

####Question 13####
require(stringr)

char_to_substring <- function(char_vector) {
  vowels_replace <- str_detect(char_vector, ignore.case("[aeiou]"))
  return (str_extract(char_vector[vowels_replace],  ignore.case("[aeiou]\\w{0,2}")))  
}

####Question 14####
require(lubridate)
month = c(5,6,7,8,9,10,11)
day = c(6,7,8,9,10,11,12)
year = c(2008,2009,2010,2011,2012,2013,2014)

df <- data.frame(day,month,year)

df["FULLDate"] <- NA
df$FULLDate <- ISOdatetime(df$y, df$m, df$d,0,0,0)

####Question 15####
require(lubridate)
string_date <- "05-09-1989"
real_date <- mdy(string_date)

####Question 16####
require(lubridate)
string_date <- "05-09-1989"
real_date <- mdy(string_date)
month(real_date)

####Question 17####
date_sequence <- seq(as.Date("2005/1/1"), as.Date("2014/12/31"), "days")
head(date_sequence)
