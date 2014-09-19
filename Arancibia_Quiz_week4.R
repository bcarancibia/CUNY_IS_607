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

avg.ratings <- rbind(ddply(m[which(m$Action == 1),], c("year"), summarise, genre = "Action", rating = mean(rating)),
                     ddply(m[which(m$Animation == 1),], c("year"), summarise, genre = "Animation", rating = mean(rating)),
                     ddply(m[which(m$Comedy == 1),], c("year"), summarise, genre = "Comedy", rating = mean(rating)),
                     ddply(m[which(m$Drama == 1),], c("year"), summarise, genre = "Drama", rating = mean(rating)),
                     ddply(m[which(m$Documentary == 1),], c("year"), summarise, genre = "Documentary", rating = mean(rating)),
                     ddply(m[which(m$Romance == 1),], c("year"), summarise, genre = "Romance", rating = mean(rating)),
                     ddply(m[which(m$Short == 1),], c("year"), summarise, genre = "Short", rating = mean(rating)))

ggplot(avg.ratings, aes(x = year, y = rating, color = genre)) +
  geom_line(size = 0.75) +
  facet_wrap(~genre) +
  stat_smooth(method = lm, se = FALSE, color = "red", size = 0.75) +
  xlab("Year of Release") +
  ylab("Averge IMDB Rating") +
  ggtitle("Avgerage IMDB Ratings by Movie Genre over Time") +
  labs(color = "Genre") +
  theme(axis.title.x = element_text(size = 18),
        axis.text.x = element_text(size = 14),
        axis.title.y = element_text(size = 18),
        axis.text.y = element_text(size = 14),
        plot.title = element_text(size = 20),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 12),
        strip.text = element_text(size = 12))

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