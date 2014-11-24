####Benjamin Arancibia#####
#9/19/2014
#Week 4 Quiz

library("ggplot2")
library("plyr")




m <- read.table("/users/bcarancibia/CUNY_IS_607/movies.tab", sep="\t", header=TRUE, quote="", comment="")

####Question 1####
###Visualization that displays total number of movies for each decade
q1 <- ggplot(data = m, aes(x=year)) + geom_bar(binwidth = 10) +ggtitle("Total Number of Movies for each Decade")
q1

####Question 2####
#average IMDB user rating for different genres. Show over time.
# Setting zeroes to NAs for easier calculating of the mean
m[,c("Action", "Animation", "Comedy", "Drama", "Documentary", "Romance", "Short")][m[,c("Action", "Animation", "Comedy", "Drama", "Documentary", "Romance", "Short")] == 0] <- NA

ratings_average<- rbind(ddply(m[which(m$Action == 1),], c("year"), summarise, genre = "Action", rating = mean(rating)),
                     ddply(m[which(m$Animation == 1),], c("year"), summarise, genre = "Animation", rating = mean(rating)),
                     ddply(m[which(m$Comedy == 1),], c("year"), summarise, genre = "Comedy", rating = mean(rating)),
                     ddply(m[which(m$Drama == 1),], c("year"), summarise, genre = "Drama", rating = mean(rating)),
                     ddply(m[which(m$Documentary == 1),], c("year"), summarise, genre = "Documentary", rating = mean(rating)),
                     ddply(m[which(m$Romance == 1),], c("year"), summarise, genre = "Romance", rating = mean(rating)),
                     ddply(m[which(m$Short == 1),], c("year"), summarise, genre = "Short", rating = mean(rating)))

ggplot(avg.ratings, aes(x = year, y = rating, color = genre)) +
  geom_line(size = 1) +
  facet_wrap(~genre) +
  xlab("Release Year") +
  ylab("Averge Rating") +
  ggtitle("Avgerage Ratings by Genre over Time") +
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

m_no_outliers<- m[m$length < 500,]
#cut out anything larger than 500 minutes
b<-ggplot(data=m_no_outliers, aes(x=length, y=jitter(rating))) + ggtitle("Length of Movie vs Rating")+
  xlab("Length")+
  ylab("Rating")
b + geom_bin2d() 


#Question 4
#length of movie vs genre
c<-ggplot(data=m) + 
  geom_boxplot(aes(x="Action", y=length[m$Action == 1]), outlier.shape = NA, fill ="grey80", color = "#3366FF") + 
  geom_boxplot(aes(x="Animation", y=length[m$Animation == 1]), outlier.shape = NA, fill ="grey80", color = "#3366FF") + 
  geom_boxplot(aes(x="Comedy", y=length[m$Comedy == 1]), outlier.shape = NA, fill ="grey80", color = "#3366FF") + 
  geom_boxplot(aes(x="Drama", y=length[m$Drama == 1]), outlier.shape = NA, fill ="grey80", color = "#3366FF") + 
  geom_boxplot(aes(x="Documentary", y=length[m$Documentary == 1]), outlier.shape = NA, fill ="grey80", color = "#3366FF") + 
  geom_boxplot(aes(x="Romance", y=length[m$Romance == 1]), outlier.shape = NA, fill ="grey80", color = "#3366FF") + 
  geom_boxplot(aes(x="Short", y=length[m$Short == 1]), outlier.shape = NA, fill ="grey80", color = "#3366FF") +
  ylim(0, 150) +
  xlab("Genre") +
  ylab("Length in Minutes") +
  ggtitle("Average length of Movie by Genre")

c+coord_flip()


#Question 5
#what other varible best predicts total number of votes that a movie received?
m_subset_length <- subset(m, length > 50 & length < 180)
#based on previous question, take a look at length that is more than 50 minutes and longer than 180
length <- ggplot(data = m_subset_length, aes(x = length, y = votes)) + 
  geom_point(aes(colour = rating), alpha=1/10) 
length

year <- ggplot(data = m, aes(x = year, y = votes)) + 
  geom_point(alpha=1/10)
year

rating <- ggplot(data = m, aes(x = rating, y = votes)) + 
  geom_point(aes(colour = rating), alpha=1/10) 

rating


m_budget_cannot_be_NA<- subset(m, budget != 0)

budget <- ggplot(data = m_budget_cannot_be_NA, aes(x = budget, y = votes)) + 
  geom_point(aes(colour = rating), alpha=1/10) 

budget




