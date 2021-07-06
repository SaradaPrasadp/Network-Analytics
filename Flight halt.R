                                   #Flight data

library(igraph)

Flight_hault = read.csv(file.choose() , header = FALSE)
colnames(Flight_hault) <- c("ID","Name","City","Country","IATA_FAA","ICAO","Latitude","Longitude","Altitude","Time","DST","Tz database time")

connecting_routes <- read.csv(file.choose() , header = FALSE)
colnames(connecting_routes) <- c("flights", " ID", "main Airport", "main Airport ID","Destination ","Destination  ID","haults","machinary")


Connecting_new <-  graph.edgelist(as.matrix(connecting_routes[, c(3, 5)]), directed = TRUE)
plot(Connecting_new)

vcount(Connecting_new)  #shows how much airport involve in the network
ecount(Connecting_new)  #shows how many connections are in the network


#degree centrality


#indegree(now we'll calculate howmany flight come to the airport)
indegree <- degree(Connecting_new, mode = "in")
max(indegree)  #shows maximum flights come to airport
index <- which(indegree == max(indegree))
indegree[index]                                   #shows the index number of the airport
which(Flight_hault$ID == 911)
Flight_hault[896, ] 


#outdegree(now qwe'll see howmany flight go frm the airport)
outdegree <- degree(Connecting_new , mode = 'out')
max(outdegree)          #shows maximum no. of flight go away frm airport
index <- which(outdegree == max(outdegree))
outdegree[index]                                   #shows the index number of the airport
which(Flight_hault$ID == 915)
Flight_hault[900, ]


#Closeness centrality(calculate which airport is close to most of the airports)
closeness_in <- closeness(Connecting_new, mode = "in", normalized = TRUE)
max(closeness_in)
index <- which(closeness_in == max(closeness_in))
closeness_in[index]
which(Flight_hault$IATA_FAA == "FRA")
Flight_hault[338, ]


#betweeness(find the importtant hub which comes between most of routes)
between <- betweenness(Connecting_new, normalized = TRUE)
max(between)
index <- which(between == max(between))
between[index]
which(Flight_hault$IATA_FAA == "LAX")
Flight_hault[3386, ]


#now we'll combine all centralities and find their corelations.
centralities <- cbind(indegree, outdegree ,closeness_in , between)
colnames(centralities) <- c("indegree" , "outdegree" , "closeness" , "betweenness")

cor(centralities)   #find the corelation


#airports with minimum corelation
plot(centralities[ ,'closeness'] ,centralities[ ,'betweenness'])

subset(centralities, (centralities[,"closeness"] > 0.016) & (centralities[,"betweenness"] > 0.06))
Flight_hault[which(Flight_hault$IATA_FAA == "LAX"), ]
Flight_hault[which(Flight_hault$IATA_FAA == "CDG"), ]
Flight_hault[which(Flight_hault$IATA_FAA == "ANC"), ]


#which is the most important airport in world.

eigenv <- eigen_centrality(Connecting_new, directed = TRUE, scale = FALSE, weights = NULL)
eigenv$vector
max(eigenv$vector)
index <- which(eigenv$vector == max(eigenv$vector))
eigenv$vector[index]
which(Flight_hault$IATA_FAA == "ATL")
Flight_hault[3584, ]


pg_rank <- page_rank(Connecting_new, damping = 0.826)
pg_rank$vector
max(pg_rank$vector)
index <- which(pg_rank$vector == max(pg_rank$vector))
pg_rank$vector[index]
which(Flight_hault$IATA_FAA == "ATL")
Flight_hault[3584, ]

