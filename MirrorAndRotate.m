Image1=imread('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\PositiveTrainingSetOri(1-400)\1.png');

Image1 = imresize(Image1,[20,20]);
Image2=rgb2gray(Image1);
Image2=imrotate(Image2,-15,'bicubic');
Image3=imrotate(Image1,15,'bilinear');
Image3=rgb2gray(Image3);
Image4=fliplr(rgb2gray(Image1));
%% 
f=Hist_Equalization(CorrectLight(Image2));


  f(1,1:4)=0;f(1,17:20)=0;
    f(2,1:3)=0;f(2,18:20)=0;
    f(3,1:2)=0;f(3,19:20)=0;
    f(4,1)=0;f(4,20)=0;
    
    f(17,1)=0;f(17,20)=0;
    f(18,1:2)=0;f(18,19:20)=0;
    f(19,1:3)=0;f(19,18:20)=0;
    f(20,1:4)=0;f(20,17:20)=0;
    Image2=f;
    %% 
    
    Image2=Image2(4:21,4:21);

    Image3=Image3(4:21,4:21);

 
    subplot(1,4,3)
imshow(Image2);
    
    subplot(1,4,1);
    imshow(Image1);
subplot(1,4,4);
imshow(Image3);
subplot(1,4,2);
imshow(Image4);

