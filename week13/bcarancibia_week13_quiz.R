###Ben Arancibia
###November 29th, 2014
###Quiz Week 13

require(microbenchmark)

x <- runif(100000000)
microbenchmark(
  sqrt(x),
  x ^ 0.5
)

run  <- function() {
  ssize <- 10000
  nboot <- 1000
  x <- runif(ssize)
  y <- replicate(nboot, sd(sample(x, ssize, TRUE)))
  sd(y)
}

for (i in 1:4) {
  cat(system.time(run())[3], " ")
}