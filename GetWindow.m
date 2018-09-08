
Image1=imread('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NegativeTrainingSet\1.jpg');
A1=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\SlidingWindowTem1\');
C1=('.bmp');

ratio=3.45;
Image=imresize(Image1,1/ratio);

%% 

Image=rgb2gray(Image);
S=0;

Gap=1;

[n,m]=size(Image);


for i=1:Gap:n
    for j=1:Gap:m
        
       if ((i+19+Gap<n)&&(j+19+Gap<m))          
            plate=Image(i:i+19,j:j+19);
          S=S+1
          %%  f=Hist_Equalization(CorrectLight(plate));
     plate=Hist_Equalization(CorrectLight(plate));
    plate(1,1:4)=0;plate(1,17:20)=0;
    plate(2,1:3)=0;plate(2,18:20)=0;
    plate(3,1:2)=0;plate(3,19:20)=0;
    plate(4,1)=0;plate(4,20)=0;
    
    plate(17,1)=0;plate(17,20)=0;
    plate(18,1:2)=0;plate(18,19:20)=0;
    plate(19,1:3)=0;plate(19,18:20)=0;
    plate(20,1:4)=0;plate(20,17:20)=0;
    I1=plate;
    I1=reshape(I1,[400 1]);
 if i==1&&j==1
     VecN=I1;
      else
     VecN=[VecN,I1];    
  end
       %%

       %% 
    end
    end
end



