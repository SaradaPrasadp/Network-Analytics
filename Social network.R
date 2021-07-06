                             # Social network

library(igraph)

Facebook <-  read.csv(file.choose() , header = TRUE)
Fbnew <- graph.adjacency(as.matrix(Facebook), mode = "undirected")
plot(Fbnew)

#some examples using differnt parameters

plot(Fbnew , layout= layout.circle)
plot(Fbnew , layout= layout.davidson.harel)
plot(Fbnew , layout= layout.drl)
plot(Fbnew , layout= layout.fruchterman.reingold)
plot(Fbnew , layout= layout.gem)



Instagram <- read.csv(file.choose() , header = TRUE)
instanew <- graph.adjacency(as.matrix(Instagram), mode = "undirected")
plot(instanew)

#some examples using differnt parameters

plot(instanew , layout= layout.circle)
plot(instanew , layout= layout.davidson.harel)
plot(instanew , layout= layout.drl)
plot(instanew , layout= layout.fruchterman.reingold)
plot(instanew , layout= layout.gem)



Linkden <- read.csv(file.choose() , header = TRUE)
linknew <- graph.adjacency(as.matrix(Linkden), mode = "undirected")
plot(linknew)

#some examples using differnt parameters

plot(linknew , layout= layout.circle)
plot(linknew , layout= layout.davidson.harel)
plot(linknew , layout= layout.drl)
plot(linknew , layout= layout.fruchterman.reingold)
plot(linknew , layout= layout.gem)


