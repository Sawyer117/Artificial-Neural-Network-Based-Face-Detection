*To run the interface and script (.m) file,some code has to be 
modified as the custom settings.

1.To run the Interface Version:The main files are AutoFaceDetect.m/AutoFaceDetect.fig
  The code in Row 276 and 277 (to load the trained neural network) has to be modified as the custom path.

2.To run the script version:
  1)To test the performance:Run the Detection_Step.m--->Merge_Step.m(In this order,don't clean the workspace)
    (For Detection_Step.m,Row 5,14,15 need to be modified,no need to modify Merge_Step.m)
  2)To train a new neural network,Run Get_Training.m,Training_Data.m,validation.m,
    however,one has to create his/her own positive training data.


*Hist_Equalization.m and CorrectLight.m are the codes for preprocessing,no modification
 needed for them.They need to be in the same path as the files mentioned above.