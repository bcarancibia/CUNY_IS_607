library(rmongodb)
library(plyr)

mongo <- mongo.create()
if (mongo.is.connected(mongo) == TRUE){
  mongo.get.database.collections(mongo, db = "unitedstates")
}