####Benjamin Arancibia####
####Week 2 Assignment - Exercises####

####Question 1####

#(a)

queue <- c("James", "Mary", "Steve", "Alex", "Patricia")
queue

#(b)
queue <- c(queue, "Harold")
queue

#(c)
queue <- queue[-1]
queue

#(d)
c(queue[1:1], "Pam", queue[2:5])
queue

#(e)
queue <- queue[-6]
queue

#(f)
queue <- queue[-which(queue == "Alex")]
queue

#(g)
match(c("Patricia"), queue)
queue

#(h)
length(queue)

####Question 2####
#Question 21 from quiz, not entirely sure of this answer#
#this finds the slope if you want to find the length of a triangle just solve a^2+b^2=c^2
a=
b=
c=
qda0 = (-b + c(-1, 1) * sqrt(b^2 - 4 * a * c))/(2 * a)
qda1 <- qda(qda0)
####Question 3####


f <- 1000/(3*7)
g <- 1000/(3*11)
h <- 1000/(7*11)
i <- 1000/(3*7*11)

e <- (3*7) + (3*11) + (7*11) + (3*7*11)

numbers_prime <- e-f-g-h-i 

numbers_prime

####Question 4####
check_triple <- function(a,b,c)
{
  if (a%*%a + b%*%b == c%*%c)
    {
    print("Triple!")
    }
  else if (a%*%a + b%*%b != c%*%c){
    print("Not a triple!")
  }
}

check_triple(3,4,5)



