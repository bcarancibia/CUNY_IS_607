####Benjamin Arancibia#####
#9/16/2014
#Week 3 Assignment

####Question 1####
#function takes vector as input returns missing values in the vector
missing_values <- function(input){
 return(sum(is.na(input)))
}

#input
vector_test <- c(101, 111111111, 22, NA, 9, 8, NA, 5, 28)
missing_values(vector_test)

####Question 2####
#data frame as input and returns named vector with number of missing values in each column of data frame
col_missing_values <- function(data_frame){
  return(apply(is.na(data_frame), 2, sum))
}

vector_test <- c(101, 111111111, 22, NA, 9, 8, NA, 5, 28)
vector_test2 <- c(NA, 8, NA, 5, 28, NA, NA, 5, 24)
vector_test3 <- c(NA, 8, NA, NA, NA, NA, NA, 5, 24)
question_2_df <- data.frame(Set1 = vector_test,Set2 = vector_test2, Set3 = vector_test3)
col_missing_values(question_2_df)


####Question 3####
#numeric vector and detemine min, max, mean, median, 1st quartile, 3rd quartile, SD, Numer of missing values
#DO NOT USE BUILT IN FUNCTIONS
#decided instead of building one big function going to write multiple functions for all the above

#sum/observations
mean <- function(input){
  sum = 0
  input<- input[!is.na(input)]
  for (i in 1:length(input)){
    sum = sum + input[i]
  }
  return (sum/length(input))
}

mean(vector_test4)

#find central value
median <- function(input){
  input<-input[!is.na(input)]
  input<-sort(input)
  if (length(input)%% 2 == 0){
    return((input[as.integer(length(input)/2)] + input[1 + as.integer(length(input)/2)])/2)
  }
  else{
    return(input[1+as.integer(length(input)/2)])
  }
}

median(vector_test4)

#lower (1st quartile)
first_quartile <- function(input){
  median_above <- median(input)
  new_values_first_qt <- input[input < median_above]
  return (median(new_values_first_qt))
}
first_quartile(vector_test4)

#upper (3rd quartile)
third_quartile <- function(input){
  median_above <- median(input)
  new_values_third_qt <- input[input > median_above]
  return (median(new_values_third_qt))
}
third_quartile(vector_test4)

#Standard Deviation need to do fomula, square root at the end
standard_deviation <- function(input){
  sum = 0
  input<- input[!is.na(input)]
  average <- mean(input)
  for (i in 1:length(input)){
    sum = sum + (input[i]-average)^2
  }
  return(sqrt(sum/length(input)))
}

standard_deviation(vector_test4)

Stats <- function(vector_test4){
  x <- list(1, 2, 3, 4, 5, 6)
  names(x) <- c("Mean", "Median", "FirstQ", "ThirdQ", "SD", "Num.NA")
  x[1] <- mean(vector_test4)
  x[2] <- median(vector_test4)
  x[3] <- first_quartile(vector_test4)
  x[4] <- third_quartile(vector_test4)
  x[5] <- standard_deviation(vector_test4)
  x[6] <- missing_values(vector_test4)
  return (x)   
}

Stats(vector_test4)

vector_test4 <-c(1:250, NA)

#that question sucked


####Question 4####
#take character or factor vector and find number of distinct elements in vector

distinct_element <- function(input){
  unique_values <- unique(input)
  distinct_length_values<- length(unique_values)
  mode <- NULL
  count <- 0
  for (values in unique_values){
    number_value <- ifelse(is.na(values), sum(is.na(input)), length(na.omit(input[input == values])))
    if (number_value > count){
      count <- number_value
      mode <- values
    }
  }
  return(list(unique = distinct_length_values, most_occuring = mode, number_times = count, missing_values(input)))
}

f <- as.factor(c("ELIZA", "BEN", "what", "cat", NA, NA, "bat", "Common", "CARLOS"))
distinct_element(f)

####Question 5####
#function with logical vector and determine true values, false values, proportion of T values and number of missing values

logical_and_true <- function(input){
  true <- table(input)['TRUE']
  false <- table(input)['FALSE']
  proportion_true <- true/(true+false)
  missing <- missing_values(input)
  logic_list <- list(TRUE_COUNT = true, FALSE_COUNT = false, PROPORTION_TRUE = proportion_true, MISSING = missing)
  return(logic_list)
}

vector_test5 <- c(NA, TRUE, FALSE, FALSE, FALSE, NA, NA, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE)
logical_and_true(vector_test5)

####Question 6####
#input of data fram and returns summary of its columns using the functions in question 3-5
#use plyr

summary_func_all<- function(input){
  summary_all<- apply(input, 2, function(x) switch(class(x), 'number' = Stats(input), 'character' = Distinct(input), 'factor' = Dinstinct(input), 'logical' = logical_and_true(input))) 
  
  return(summary_all)
}


x <- c(1, 5, 6, 21, NA)
y <- c(99, 3, 5, NA, NA)
z <- c(NA, NA, 9, 3, 39)
question_6_DF <- data.frame("first" = x, "sec" = y, "third" = z)
summary_func_all(question_6_DF)