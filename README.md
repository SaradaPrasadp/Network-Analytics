# Network-Analytics
Network Analysis is useful in many living application tasks. It helps us in deep understanding the structure of a relationship in social networks, a structure or process of change in natural phenomenons, or even the analysis of biological systems of organisms.
Again, let’s use the network of social media users as an example. Analyzing this network helps in
Identifying the most influent person/people in a group
Defining characteristics of groups of users
Prediction of suitable items for users
Identifying CM targets ,etc.
Other easy-to-understand examples are the Friend Suggestion function in Facebook or Follow Suggestion function in Twitter.
Who is the Important Person?
A crucial application of network analysis is identifying the important node in a network. This task is called Measuring Network Centrality. In social network analysis, it can refer to the task of identifying the most influential member, or the representative of the group.

Image by Author
For example, which node do you think is the most important one in the above figure?
Of course, to define the most important node, we need a specific definition of the Important Node. There are several indicators used to measure the centrality of a node.
Degree centrality: node with a higher degree has higher centrality
Eigenvector centrality: adding to the degree of one node, the centralities of neighbor nodes are considered. As a result, the eigenvector corresponding to the highest eigenvalue of the adjacency matrix represents the centrality of nodes in the network
Betweenness centrality: the number of paths between two nodes that go through the i-th node is considered as the i-th node’s betweenness centrality.
Closeness centrality: the length of the path from the i-th node to other nodes in the network is considered as the i-th node’s closeness centrality. With this definition, for example, this centrality can be applied in the task of defining a suitable evacuation site in a city.
import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
G = nx.Graph()
G.add_nodes_from(["A","B","C","D","E","F","G","H","I","J","K"])
G.add_edges_from([("A","C"),("B","C"),("C","D"),("D","E"),
("D","G"),("A","G"),("F","H"),("G","H"),("H","I"),
("I","J"),("I","K")])
nx.draw(G, node_size=400, node_color='red', with_labels=True, font_weight='bold')
print("degree centrality:")
for k, v in sorted(nx.degree_centrality(G).items(), key=lambda x: -x[1]):
      print(str(k)+":"+"{:.3}".format(v)+" ", end="")
print("\n")
print("eigenvector centrality:")
for k, v in sorted(nx.eigenvector_centrality(G).items(), key=lambda x: -x[1]):
      print(str(k)+":"+"{:.3}".format(v)+" ", end="")
print("\n")
print("between centrality:")
for k, v in sorted(nx.betweenness_centrality(G).items(), key=lambda x: -x[1]):
      print(str(k)+":"+"{:.3}".format(v)+" ", end="")
print("\n")
print("closeness centrality:")
for k, v in sorted(nx.closeness_centrality(G).items(), key=lambda x: -x[1]):
      print(str(k)+":"+"{:.3}".format(v)+" ", end="")
print("\n")

Image by Author

Image by Author
Who are we?
Another application of network analysis is the Community Detection task. This task purpose to divide a network into groups of nodes that are similar in any specific features. Examples of this task are a task of defining groups of users in SNS who share common interests/opinions, find groups of customers to advertise specific items, recommendation systems in online shopping systems, etc.
Many researchers are working on algorithms to effectively solve community detection problems. Some well-known algorithms/methods in this task are Kernighan-Lin algorithms, Spectral Clustering, Label propagation, Modularity Optimization, etc.

sample code

Image by Author

Image by Author
What is else?
Besides these applications, network analysis also plays important role in time series analysis, natural language processing, telecommunication network analysis, etc. Recently, the technology of Machine Learning (Deep Learning) is also used in network analysis. In this case, research on Graph Embedding and Graph Neural Networks are interesting topics.
For more detail, I recommend the following sites and textbooks.
Network Science (http://networksciencebook.com/)
Networks: A Very Short Introduction
(http://www.veryshortintroductions.com/view/10.1093/actrade/9780199588077.001.0001/actrade-9780199588077)
Networks, Crowds, and Markets
(https://www.cs.cornell.edu/home/kleinber/networks-book/)
Mengsay Loem
Senior at Tokyo Tech | Computer Science

Follow
MENGSAY LOEM FOLLOWS
Phylypo Tum
Phylypo Tum
Vitou Phy
Vitou Phy
See all (5)

27


1


Sign up for The Variable
By Towards Data Science
Every Thursday, the Variable delivers the very best of Towards Data Science: from hands-on tutorials and cutting-edge research to original features you don't want to miss. Take a look.

Get this newsletter
Emails will be sent to psarada183@gmail.com.
Not you?

27


1




Network Analysis
Network Science
Network Centrality
Community Detection
More from Towards Data Science

Follow
Your home for data science. A Medium publication sharing concepts, ideas and codes.

Maarten Grootendorst

·Mar 23

Misleading Graphs
… and how to fix them!
One, perhaps underestimated, aspect of any data-related job is presenting and visualizing your results. Communicating the data that you have at your disposal can be incredibly difficult. With that comes the possibility of accidentally creating misleading graphs.
Although most of us know about the many issues pie charts can present (here, here, and here), there are many ways charts could be misleading.

Not all pie charts are bad! Image by the author.
To bring this into perspective, I have found myself creating misleading charts in the past and have to be careful of not doing that still!
And I would argue that most people have this problem. …
Read more · 6 min read

199


1




Share your ideas with millions of readers.

Write on Medium
Pavan Tummala

·Mar 23

Things I Learned as an ML Product Manager — Part 1
How managing a product with ML is different from managing traditional products

Image credit: Deepak Pal http://www.iqlect.com/ CC 2.0
Managing a product that leverages Machine Learning (ML) is quite different from managing a traditional non-ML product. In this post, I will highlight a few key differences that I observed so far in my career. You might find this useful if you are switching to an ML Product Manager role or if you are simply curious about the differences.
1. Relentlessly focus on the customer problem
Ok, this is not an ML product specific advice. It’s a classic Product Management mantra. Define the customer problem first — “what”, “why” and “who” before diving into the “how”.
But ML product managers are especially prone to the fallacy of…
Read more · 6 min read

61


1




Jovan Veljanoski

·Mar 23


Stock image from pixabay.com
How to train and deploy a machine learning model with Vaex on Google Cloud Platform
Introduction
Training a machine learning (ML) model is often a rather lengthy and computationally intensive task, especially when using larger quantities of data.
Regardless of whether you are using your favorite deep learning framework, trusted gradient boosting machine or a custom ensemble, the model training phase can easily consume most if not all available resources on your laptop or local server, effectively “freezing” your machine and preventing you to do other tasks. …
Read more · 17 min read

251


1




Dennis Meisner

·Mar 23

What We Can Learn From Google’s Long-Term AB Test
Avoiding the Short-Term Value Trap in Online Experiments

(Image edited from unsplash.com)
In AB Testing, we focus on the short-term impact of a particular change:
- Does a new feature lead to a higher conversion rate?
- Does a design change encourage more users to engage with a particular feature?
If the answer is yes, the change is launched to all users.
But short-term goals can conflict with a business’s more critical long-term objectives. Think about a supermarket raising its prices, which might lead to higher profits in the short-term. In the long-term though, this can decrease the store’s revenue if more customers choose to buy from competitors.
