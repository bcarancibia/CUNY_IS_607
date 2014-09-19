####Benjamin Arancibia#####
#9/19/2014
#Week 4 Quiz

library("ggplot2")
library("plyr")
library("grid")
library("gridExtra")
library("shiny")



m <- read.table("/users/bcarancibia/CUNY_IS_607/movies.tab", sep="\t", header=TRUE, quote="", comment="")

####Question 1####
###Visualization that displays total number of movies for each decade
m$decade <- as.factor((m$year %/% 10) * 10)
q1 <- ggplot(data = m, aes(x=year)) + geom_bar(binwidth = 10) +ggtitle("Total Number of Movies for each Decade")
q1

####Question 2####
#average IMDB user rating for different genres. Show over time.
# Setting zeroes to NAs for easier calculating of the mean
m[,c("Action", "Animation", "Comedy", "Drama", "Documentary", "Romance", "Short")][m[,c("Action", "Animation", "Comedy", "Drama", "Documentary", "Romance", "Short")] == 0] <- NA

Get.Ratings <- function(df){
  # Finds the means of the different Genres, removing the NAs (which were previously zeroes)
  Ratings <- c(mean(df$Action * df$rating, na.rm=T), 
               mean(df$Animation * df$rating, na.rm=T), 
               mean(df$Comedy * df$rating, na.rm=T), 
               mean(df$Drama * df$rating, na.rm=T), 
               mean(df$Documentary * df$rating, na.rm=T), 
               mean(df$Romance * df$rating, na.rm=T), 
               mean(df$Short * df$rating, na.rm=T))
  return (t(Ratings))
}

ratings.over.time <- data.frame(numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0), numeric(0))
overall.avg <- Get.Ratings(m)
for (i in 1:(length(levels(m$decade)))){
  # This could be vectorized, but this works quickly
  ratings.over.time <- rbind(ratings.over.time, c(as.numeric(levels(m$decade)[i]), Get.Ratings(subset(m, decade==levels(m$decade)[i]))))
}
names(ratings.over.time) <- c("Decade", "Action", "Animation", "Comedy", "Drama", "Documentary", "Romance", "Short")

#plot one graph
ggplot(ratings.over.time, aes(Decade)) + 
  geom_line(aes(y=Action, col="Action"), size=1.5) + 
  geom_line(aes(y=Animation, col="Animation"), size=1.5) + 
  geom_line(aes(y=Comedy, col="Comedy"), size=1.5) + 
  geom_line(aes(y=Drama, col="Drama"), size=1.5) + 
  geom_line(aes(y=Documentary, col="Documentary"), size=1.5) + 
  geom_line(aes(y=Romance, col="Romance"), size=1.5) +  
  geom_line(aes(y=Short, col="Short"), size=1.5) +
  ggtitle("Ratings over Time") +
  ylab("Average rating") + 
  theme(legend.title=element_blank())


####Question 3####
#length of movie vs rating

length.rating <- ggplot(data=m, aes(x = rating, y = length)) + geom_point()
length.rating
#yikes lots of outliers
cor(m$length, m$rating)

m.short <- m[m$length < 500,]
b<-ggplot(data=m.short, aes(x=length, y=jitter(rating)))
b + geom_bin2d()
c<-ggplot(data=m.short, aes(x=length, y=jitter(rating))) 
c + geom_bin2d()

#Question 4
#length of movie vs genre
ggplot(data=m) + 
  geom_boxplot(aes(x="Action", y=length[m$Action == 1]), outlier.shape = NA) + 
  geom_boxplot(aes(x="Animation", y=length[m$Animation == 1]), outlier.shape = NA) + 
  geom_boxplot(aes(x="Comedy", y=length[m$Comedy == 1]), outlier.shape = NA) + 
  geom_boxplot(aes(x="Drama", y=length[m$Drama == 1]), outlier.shape = NA) + 
  geom_boxplot(aes(x="Documentary", y=length[m$Documentary == 1]), outlier.shape = NA) + 
  geom_boxplot(aes(x="Romance", y=length[m$Romance == 1]), outlier.shape = NA) + 
  geom_boxplot(aes(x="Short", y=length[m$Short == 1]), outlier.shape = NA) +
  ylim(0, 175) +
  xlab("Genre") +
  ylab("Length (in minutes)") +
  ggtitle("Average length of movie by genre")

#Question 5
m.180 <- subset(m, length > 50 & length < 180)
length <- ggplot(data = m.180, aes(x = length, y = votes)) + 
  geom_point() +
  geom_smooth(method = "lm")

year <- ggplot(data = m, aes(x = year, y = votes)) + 
  geom_point() +
  geom_smooth(method = "lm")

rating <- ggplot(data = m, aes(x = rating, y = votes)) + 
  geom_point() +
  geom_smooth(method = "lm")

m.budget <- subset(m, budget != 0)

budget <- ggplot(data = m.budget, aes(x = budget, y = votes)) + 
  geom_point() +
  geom_smooth(method = "lm")

grid.arrange(length, year, rating, budget, ncol = 2)