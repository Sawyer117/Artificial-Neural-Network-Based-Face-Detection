A=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\PositiveTrainingSet(1)\');
%输入文件夹
A1=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\PositiveRotate\');
%输出文件夹

C=('.bmp');%输入文件格式

C1=('.bmp');%输出文件格式

for i=1:1400 %样本区间

B=num2str(i);
D=strcat(A,B,C);
I=imread(D);
%I = rgb2gray(I);
%I = imresize(I,[20,20]);
%%  Code for Rotation

I=imrotate(I,12,'bilinear');
I=I(4:21,4:21);
I=imresize(I,[20 20]);

%%
%PreProcessing--------------------------------
    f=I;

%   f=Hist_Equalization(CorrectLight(I));
    f(1,1:4)=0;f(1,17:20)=0;
    f(2,1:3)=0;f(2,18:20)=0;
    f(3,1:2)=0;f(3,19:20)=0;
    f(4,1)=0;f(4,20)=0;
    
    f(17,1)=0;f(17,20)=0;
    f(18,1:2)=0;f(18,19:20)=0;
    f(19,1:3)=0;f(19,18:20)=0;
    f(20,1:4)=0;f(20,17:20)=0;
    I=f;
    %%
    
%I=fliplr(I);
%%



B1=num2str(i+2800);%命名规则
D1=strcat(A1,B1,C1);
imwrite(I,D1);


end

