# Artificial Neural Network Based Face Detection
--Matlab based Interface for Face Detection

This is the project directed by prof.Hilmi Dajani

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

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908230525.png" width="80%" height="80%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.1 The integrated GUI of the face detection system.</p>

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908231341.png" width="80%" height="80%" alt="model of an artificial neuron"/></div>
<p align="center">
  <div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908231519.png" width="80%" height="80%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.2 Output obtained from the system described above (arbitrating from two neural network). For the notation on the top-left corn, three numbers are shown: the number of faces in the image, the number of faces detected correctly, and the number of false detection. For portrait image that only has one or two faces, the accuracy is high, it seldom gives out false positive/negative results. A detailed description of the algorithms and button function of GUI will be given as follows</p>


**METHODS**

The basic function of the entire system is a filter which receives 20 by 20 pixel region of the image as an input and generates an output ranging from 0 to 1(-1 to 1 in original paper of rowley[1], due to different activation function of output layer), signifying the presence or absence of a face, namely. In order to detect faces anywhere in the objective image, the filter is applied at every location in the objective image. To further detect faces larger than the window size, the input image is repeatedly subsampled to decrease the size, and then the filter would be applied at each size of these subsampled images [11].
Therefore, the artificial neural network based face detection system would be introduced in the following three parts: The pre-processing stage was firstly applied on the inputs of the every single image; then the training progress would be introduced and discussed in terms of their performance. Finally the merging and arbitrating stage would be implemented in order to eliminate the overlapping detections.

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908223001.png"/></div>
<p align="center">Fig.1 The basic algorithm used for face detection[1]  </p>


**A. Pre-processing**
The actual image quality would be affected by the position of the photographer, the conditions of the external light source and so on. Therefore, some of the facial features would also be covered or shrunk to some degree. The preprocessing stage attempts to fix this gap to compensate and equalize the intensity values across the window.

**· Linear Fitting Process.**
We fit a function which varies linearly across the window to the intensity values in the whole region inside the window. Pixels near the edge of the image could be considered as the background, so those intensity values should be ignored in the processing when the filter is going to compute the lighting variation across the face in the objective images. The linear function which used to fit the objective image would approximate the overall brightness of each part of the window and can be also subtracted from the window to make a compensation for a variety of lighting conditions.

1). Initialize two vectors, which represents the sampled intensity values in the middle of the window image, in horizontal and vertical direction respectively;

2). Coefficient undetermined linear functions would be applied to the two vectors respectively, so that the linear function would be represent the overall trend of the intensity values, and the fitting coefficients would be recorded;

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908221759.png" width="50%" height="50%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.2 The result of the fitting function processing.(a) the intensity variation in horizontal; (b) the intensity variation in vertical; (c) and (d) the linear function fitting the sampled intensity values. </p>

3). Generate a new correcting plate image, which intensity values in horizontal and vertical would be distributed as the fitting linear presents;

4). Converge the correcting plate image and the original window image to achieve the compensation.

**·Histogram Equalization:**
Then, histogram equalization is performed, which nonlinearly maps the intensity values to expand the range of intensities in the window. The histogram is computed for pixels inside the region in the window. This compensates for differences in camera input gains, as well as used to enhance contrast. It is not necessary that contrast will always be increase in this.
1). First we have to calculate the probability mass function of all the pixels in this image;
2). The next step involves calculation of cumulative distributive function;
3). The last step, in which we have to map the new gray level values into number of pixels, and map these new values you are onto histogram.
In order to ignore the background, which could influence the facial feature during the pre-processing, a background mask could be used to eliminate this kinds of factors. The examples of the pre-processing results are shown in figure below.

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908222421.png" width="50%" height="50%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.3 The steps in pre-processing a window region. First, a linear function is fit to the intensity values in the windows, and then subtracted out, correcting for some extreme lighting conditions. Then, histogram equalization is applied to the entire window. (a) Original window; (b) Best fit linear function; (c) Lighting corrected window; (d) Histogram equalized window. </p>

**B.Data**

First, the positive training data were downloaded from the database provided by university of Massachusetts (FDDB), then, each one of the positive training example was cropped manually out of the original image.

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908223751.png" width="50%" height="50%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.4 The sample Positive Training Data </p>

A total number of 700 images of face was cropped.(as in Fig.4). For the manual cropping was too exhausting, the face data set could be enlarge quickly by introducing rotation and mirroring [11]. And with mirroring, rotating by 15 degree in left & right direction respectively (as in Fig 10, the pre-processing step is followed right after), the positive training data was enlarged 6 times. Thus, a total number of 4200 positive examples were generated.

As for negative training examples, Practically any image can serve as a non-face example because the space of non-face images is much larger than the space of face images [11]. Based on this conclusion, the negative training examples could be generated by “slicing” the picture that have no faces in it at all, and each of the “slice” could serve as a negative example. To do the “slicing”, a sliding window is applied, by going through all the image, multiple negative examples could be generated with 1 original image. And by doing so, a total number of 11114 non-face training examples were generated. In addition,500 pictures in which pixel values are randomly generated are also included as negative training examples in order to enhance it is robustness. With the method mentioned previously, so far 4200 positive training data that contained face are generated, and a total number of 11614 of negative training data that are non-face are gathered also (11114 of them are cropped automatically by sliding window, 500 of them are randomly generated noise-like image), so the total number of training data we got is 15814.

**C.Training**

The ANN can now be trained as all the training data generated. Here the toolbox in Matlab2013b is used to simplify the process. In training, the toolbox would automatically break the input data set into three categories:
Training set, Validation set and Test set. Training set is a set of examples used for learning, that is to fit the weights in ANN. Validation set is used to tune the architecture(numbers of hidden neurons) of ANN. Test set has no direct influence over ANN structure, it is a set of examples used only to assess the performance (generalization ability) of a fully specified ANN. Although the toolbox did most of the job in building and training ANN, what’s the number of neurons that fits best for the task is vague. So in experiment, different numbers of hidden units were chosen (10, 30, 50, 70, 100 and 200) and performance were compared. The figures depicting the performance are listed below.

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908224424.png" width="50%" height="50%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.5 The entropy curve of performance (From top-down, left-right, the
neuron are 10, 30, 50, 70, 100, 200). </p>

**D.Merging**

After the previous steps, there are many false detections of faces and the overlapping detections of the same face. In this
step, the arbitration could be used to decrease and narrow down the wrong detections of a single neural network, and then,
using the idea based on morphological operation to eliminate the overlapping detection of the same face [1]. In this project, the process to merge the overlapping face is different  with respect to the original work of rowley[1].

Most faces are detected at multiple nearby positions, while false detections often occur with less consistency. This observation leads to a merging method which can eliminate many overlapping detections. For each location, the number of detections within a specified neighborhood of that location can be counted. If the number is above a threshold, then that location is classified as a face. This project used the morphology to narrow down area of the overlapping area, and could further eliminate the false detections, which presents in some isolated pixels. To merge the overlapping detections, a distance based clustering of the presenting detection can be proposed. The same face detection could be varied around a dense area, therefore, the distance from the same corner or the centroid to a constant fixed pixels would be clustered into the same class. The up and left corner of the nearby detections defines the location of the detection result box, thereby in the experiments section, this distance differences will be processing referred to as “threshold”. If a clustered particular location is significantly varied with respect to the other clustered detection location, which can indict that there is a new detection presence. Then the correctly identified as a face, and all other detection locations which overlap it, because they are likely to be errors and can therefore be eliminated.

1). According to the outputs of the arbitration neural networks, a mapping image, which presenting the high presence probabilities of the face detection (more than 98%), can be generated;

2). Morphology method, which using a fixed structure element, can play a role of close operation, the isolation of a few false detection could be eliminated, and the computation in the further merging step could be significantly reduced as well;
3). Create and initialize an vector, so that the vector can be used to store the distance from the top left corner of every single detection to the image’s origin;

4). Find the distance clusters and locate the significantly changed pixels, final map the coordinates to the image, to accomplish the face detection.

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908225740.png" width="50%" height="50%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.6 The diagram of merging. (a) The arbitrated image; (b) The mapping image with the high probabilities of presence of a face detection; (c) Mapping image after close operation; (d) Clustering in terms of the distance; (e) Overlapping eliminated mapping image. (f) Face detection image after merging processing step. </p>

<div align="center"><img src="https://github.com/Sawyer117/Artificial-Neural-Network-Based-Face-Detection/blob/master/Pic/20180908230010.png" width="50%" height="50%" alt="model of an artificial neuron"/></div>
<p align="center">Fig.7 The results of the merging processing. (a) The structure elements used in the close operation implementation; In the (b) and (c), (i) The result from the previous arbitration step; (ii) The mapping image with the high probabilities of presence of a face detection; (iii) Mapping image after close operation; (iv) Overlapping eliminated image. </p>

**Introduction of GUI**

All the functions and process steps mentioned above can be operated one after another sequentially, however, a graphical user interface (GUI) was built and serve as an integration of the whole programs. The important buttons are introduced as follows:

**A. Crop Button**
The Crop Button here enables users to manually crop a rectangle region in the input image that roughly matches the area with the face in the image. It is realized by the “getrect” Function in Matlab. The reason why this button is included here is because the unacceptably high computational cost, to sample an image with a small window, according to the size of the original image, the sample may go between 1000 and 20000times.Not to mention that the size of the face is not a constant, thus an image has to go under multiple times of down-sampling to be adjusted to the size of the face. In implementation, to sample a relatively small image, the computational cost is merely acceptable (about 1-2minutes.)If the input image become large (e.g. 1000*800 pixels), it would generate about 27000 sub-sampled images, and the total running time would go even more than 15 minutes. By introducing this crop button, because the size of the face is manually decided, the re-size ratio is also settled, thus, the input image is only down-sampled one time. And the time cost would be reduced greatly. (Although in the future, after we come up with a way to reduce the computational cost, we would cancel this function and do the face-detection in an automatic way.)

**B. Face-Detect Button**
The Face-Detect button enables the users to inspect the performance of the trained neuron network in an easy way. One can load the arbitrary image and crop any-part of the image, or some typical image which neuron network always make mistakes in classifying. How is it realized is by loading two trained neuron network: Both of them are with 100 hidden units, but one of them are trained with more negative examples. (So it is output may have higher precision but less recall, just to compensate the other neuron network)An arbitration part as introduced in the previous chapter is made, and the threshold at which we would accept it is a human face can also be adjusted (the value is chosen to be 0.98 in an empirical way).

**C. Auto-FaceDetect Button**
The auto face detect button passes a window through the down-sampled image, and the area which was determined as face would be recorded. And based on those region, the rectangles are plotted to highlight the face. The down-sample ratio is calculated based on the manual cropped image. Because the training data are all 20*20 images. The user cropped image would also to be considered as a 20*20 image. Thus the bigger value of real height and width of the user cropped image is compared to 20 and determine the ratio. We assume all the face in one image have similar size. Thus, by passing through a fixed-size sliding window, the face could be detected. As the face detected, the position would be recorded into a matrix, and in the same time, the rectangle command in Matlab plots the highlighted face area.

**D. Merging Button**
The merging button here merges all the rectangles belong to one face. The reason and the method are introduced in the previous chapter.
A standard process of using this GUI is described below: First, the user would load an test image (original image), then, the user should crop the rectangle area that are similar to face, after that, clicking “FaceDetect” button he could inspect the probability of face in that area, and he can decided if the cropped area is good or not. And the user could also click the “Auto-FaceDetect” button, the software would resize the image based on the ratio calculated in the crop step, then a small window would be passed over all portions of the image, and the detection would be made within each and every one of the sub-sampled window. The rectangle is plot in each iteration. After the Detection finishes, one can click the merge button to see a clear highlighted face image.

**CONCLUSION&FUTURE WORK**

A. Conclusion
From the final result and comparison with other system, many advantages and disadvantages of this face detection system had emerged. First, for this system is trained based on the intensity distribution of face, it gave the system significant robustness in classifying face: gray-scaled face, cartoon face, etc. As showed in the result images, when classifying portrait pictures, this system showed excellent performance, it seldom misses faces, even if so, it was introduce by the flaw of later steps (e.g. the flaw in erosion and merging).The disadvantages are also obvious, first and most severe one is that the computational cost is incredibly high. In implementation, to process one signal image would cost 3-15 minutes. When the face is small (compared to the input image), in order to search and sample every portion of image, the sliding window operation could repeat for over 20000 times! Apparently it is unacceptable, this only way to reduce the computational cost is to set a gap parameter to let the sliding window “jump” instead of sampling pixel by pixel. But it is a trade-off between time and accuracy, for the window now could “jump” over the face area, and increase the false negative rate, for now, there are no sound way to solve this problem. Another problem is within the neural network itself, for the pattern of face is relatively obvious, but the feature of non-face image is hard to generalize. When the input images has symmetry structure, face-like intensity distribution caused by lighting condition or other factor, the neural network also accept them as a face, which could be hard to eliminate. In conclusion, the neural network face detection system implemented here so far has high accuracy in detecting faces in portrait image, and the input image has no constrains. The drawbacks are that the computational cost is too high.

The training processing step was limited by the insufficient datasets, therefore, a number of windows with a similar facial intensity distribution would be detected as the face; the merge processing step using a close operation, but the improvements can be the structure elements, which would filter some isolated false detections, however, the true faces can be ignored by this processing as well. A distance based merging method then applied, when it comes into the cases that the faces are arranged along the concentric circles, these faces would be merged into only one single detections, with other faces lost in this processing. Those aspects we discussed could significantly affected the performance of the system, especially for a large amount of faces integrated into a single image. Therefore there can be improvements in the further implementation.

**B. Future work**
A great proportion of false positive/negative was caused by the neural network itself. By collecting more data and use the bootstrap algorithm introduce in Rowley’s paper, the performance of ANN can be better without doubt. Then, a better algorithm such as hierarchical clustering could be applied for a better merging performance. Also, as we see in other papers that there is a way to make the input face image rotation in-invariant and translation invariant, with this feature, we can set a bigger gap value for sliding window to reduce the computational cost greatly. At last, we would get the program to automatically down-sample the image and detect all the faces in input images, better in a real-time manner, in order to fully complete the function of this face-detection software.
