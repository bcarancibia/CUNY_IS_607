###Benjamin Arancibia
###December 1, 2014
###Project 5


require(RNeo4j)
clear(graph)

#Load sample data into R
graph = startGraph("http://localhost:7474/db/data/")
importSample(graph, "tweets")
#load process
neo4j = getUniqueNode(graph, "User", screen_name = "neo4j")
sapply(lapply(outgoingRels(neo4j, "POSTS"), endNode), function(t) t$text)

#cypher query
query = "
MATCH (:Tweet)-[:MENTIONS]->(u:User)
RETURN u.screen_name AS user, COUNT(*) AS mentions
ORDER BY mentions DESC
LIMIT 10
"
cypher(graph, query)


####Question 4
##Advantages of Graph Database
#Neo4j offers a nice way to view the data and Loads data as documents instead of relational model, and
#makes it easier visualize how things are related to each other.

##Disadvantages of Graph Database
#Relational model minimizes duplicate data being stored, but graph model databases 
#may not minimize duplicate data depending on the complexity of the data. #Neo4j is not a mature piece of software yet 
#so it can be very buggy, hard to use, and does not have a large community.
#The tradiational way of having relational model for your data can be hard to convert to a graph model


