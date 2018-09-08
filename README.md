# Artificial-Neural-Network-Based-Face-Detection
--Matlab based Interface for Face Detection

Written by

Shuangyue Wen
M.A.s.c 
Electrical and Computer Engineering
University of Ottawa
Ottawa, ON, Canada
swen046@uottawa.ca

Xunzhe Wen
M.A.s.c 
Electrical and Computer Engineering
University of Ottawa
Ottawa, ON, Canada
xwen055@uottawa.ca

**Abstract**—This project aims to implement the functional task of detecting upright, frontal face in the images by using the artificial neural network. The face detection system we have implemented based on a previously-trained neural network. The objective image was firstly divided into lots of sub-windows, which would be pre-processed, and each of those window went through the trained neural network to make a judgment whether each sub-window contains a face; then the system would arbitrates among the sub-windows in order to converge the overlapping detected faces. A retinal connection to the neural networks would be biologically motivated and presented. We chose the different components of the training set to evaluate the development of the system.

**Keywords—Face detection; computer vision; artificial neural networks, machine learning.**


The structure of the ANN is like it is a biological inspiration: a computational model formed by hundreds of artificial neurons, connected with coefficients (weights) by which neural structure is constituted. They are also known as processing elements (PE) as they process information [9]. Each PE has weighted inputs, transfer function and one output. In the concept of machine learning, the most significant thing of PE is an equation which balance inputs and outputs, different equations can be chosen based on different requirements, the sigmoid function is typically the most widely used one. ANNs are also called connectionist models as the connection weights represent the memory of the system. Although even one single neuron can accomplish a certain information processing procedure, the power of neural computations eventually comes from all the connections of neurons in a network. The supposed intelligence of artificial neural networks is a matter of argument. Artificial neural networks rarely have more than a few hundred or a few thousand processing elements, while the human brain has about 100 billion neurons.
To consider the great difference of a modern ANN with a human brain in complexity, we know that the ANN is still far away from the creative capacity of the human brain. The human brain is of much more complexity and, unfortunately, the mechanism of how
brain works are still not well known, people are still
debating on how the consciousness and cognitive come
into existence. Anyway, ANNs are capable of
processing extensive numbers of data sets and to make
predictions that are sometimes surprisingly accurate.
This will not give them intelligence in the common
‘human’ sense of the word, so the term computer
intelligence may be a better way of describing these
systems. There are many types of neural networks
designed and new ones are invented every week but all
can be described by the transfer functions of their
neurons, by the learning rule, and by the connection
formula.
