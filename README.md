# Artificial-Neural-Network-Based-Face-Detection
--Matlab based Interface for Face Detection

This is the project for course ELG7172 directed by prof.Hilmi Dajani

The goal is to reproduce the work of Henry A. Rowley in [1]

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

**Keywords—face detection; computer vision; artificial neural networks, machine learning.**

**Basic Introduction of ANN**
The structure of the ANN is a computational model formed by hundreds of artificial neurons like its a biological inspiration. Each neuron is connected with others by a certain group of coefficients (weights,biases). They are also known as processing elements (PE) as they process information. Each PE has weighted inputs, transfer function(activation) and one output. In the concept of machine learning, the most significant thing of PE is an equation which balance inputs and outputs, different equations can be chosen based on different requirements, the sigmoid function is typically the most widely used one. ANNs are also called connectionist models as the connection weights represent the memory of the system. Although even one single neuron can accomplish a certain information processing procedure, the power of neural computations eventually comes from all the connections of neurons in a network. The supposed intelligence of artificial neural networks is a matter of argument. Artificial neural networks rarely have more than a few hundred or a few thousand processing elements, while the human brain has about 100 billion neurons.

<div align="center"><width="50%" height="50%" src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908182450.png"/></div>

<img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908182450.png" width="50%" height="50%" alt="图片名称" align=center />
**METHODS**
The basic function of the entire system is a filter which receives 20 by 20 pixel region of the image as an input and generates an output ranging from 1 to -1, signifying the presence or absence of a face, namely. In order to detect faces anywhere in the objective image, the filter is applied at every location in the objective image. To further detect faces larger than the window size, the input image is repeatedly subsampled to decrease the size, and then the filter would be applied at each size of these subsampled images [11].
Therefore, the artificial neural network based face detection system would be introduced in the following three parts: The pre-processing stage was firstly applied on the inputs of the every single image; then the training progress would be introduced and discussed in terms of their performance. Finally the merging and arbitrating stage would be implemented in order to eliminate the overlapping detections.

**A. Pre-processing**
The actual image quality would be affected by the position of the photographer, the conditions of the external light source and so on. Therefore, some of the facial features would also be covered or shrunk to some degree. The preprocessing stage attempts to fix this gap to compensate and equalize the intensity values across the window.
· Linear Fitting Process.
We fit a function which varies linearly across the window to the intensity values in the whole region inside the window. Pixels near the edge of the image could be considered as the background, so those intensity values should be ignored in the processing when the filter is going to compute the lighting variation across the face in the objective images. The linear function which used to fit the objective image would approximate the overall brightness of each part of the window and can be also subtracted from the window to make a compensation for a variety of lighting conditions.
1). Initialize two vectors, which represents the sampled intensity values in the middle of the window image, in horizontal and vertical direction respectively;
2). Coefficient undetermined linear functions would be applied to the two vectors respectively, so that the linear function would be represent the overall trend of the intensity values, and the fitting coefficients would be recorded;
