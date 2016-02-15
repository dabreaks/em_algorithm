# em_algorithm

an implementation of (Expectation Maximization)[https://en.wikipedia.org/wiki/Expectation%E2%80%93maximization_algorithm] in matlab

**em.m** takes in a labeled dataset and performs expectation maximization to classify data into *k* classes. 

The current implementation runs for 100 iterations for K = 2; 4; 8; 10.
For each K, it plots the log likelihood over the 100 iterations. 
During the final iteration of each model, it plots the data and indicate the most probable cluster of each observation.

The subsequent scripts calculate various distributional parameters, some not used in the current implementation. 