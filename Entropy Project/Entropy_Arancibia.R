####Benjamin Arancibia####
#Programming Entroy and Information Gain Project
#September 16, 2014

#dataset import
data <- read.table(file="/users/bcarancibia/CUNY_IS_607/Entropy Project/entropy-test-file.csv", header = TRUE, sep=",", stringsAsFactors=FALSE)


####Question 1####
#create entropy function that takes input and returns numeric value
entropy <- function(input){
  observations <- length(input)
  table_test <- table(input)
  p <- table_test/observations
  sigma <- p*log2(p)
  sigma[is.na(sigma)] = 0
  entropy = -1 * sum(sigma)
  return (entropy)
}

####Question 2####
#create function for information gain that takes two vectors and returns info gain of the attribute
information_gain <- function(target, attribute){
  observations <- length(attribute)
  split <- table(attribute)
  values <- names(split)
  values_observations <- length(values)
  probability <- split/observations
  target_entropy <- entropy(target)
  attribute_entropy <- 0
#create splice of the values and find the probability
#partition
  for (i in 1:values_observations){
    attribute_entropy <- attribute_entropy + probability[i] * entropy(target[attribute==values[i]])
  }
  return (target_entropy - attribute_entropy)  
}

####Question 3####
decide <- function(){
  
}









####final tests
entropy(data$answer)
information_gain(data$answer,data$attr1)
information_gain(data$answer,data$attr2)
information_gain(data$answer,data$attr3)

