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



