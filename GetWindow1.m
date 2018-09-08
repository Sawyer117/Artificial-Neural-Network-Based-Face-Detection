
Image1=imread('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\TestTem\8.jpg');
A1=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\SlidingWindowTem1\');
C1=('.bmp');

[m,n]=size(Image1);
Image=imresize(Image1,[m/3.5,n/3.5]);

f=rgb2gray(Image);

plate=zeros(20);
S=1;
% k=zeros(1);
vector=zeros(1);
Gap=3;
% unit=fix(m/Gap);
count=0;
for i=1:Gap:n
    for j=1:Gap:m
        
       if ((i+Gap<n)&&(j+Gap<m))
           
           plate=[f(i,j:j+19);f(i+1,j:j+19);f(i+2,j:j+19);f(i+3,j:j+19);
                  f(i+4,j:j+19);f(i+5,j:j+19);f(i+6,j:j+19);f(i+7,j:j+19);
                  f(i+8,j:j+19);f(i+9,j:j+19);f(i+10,j:j+19);f(i+11,j:j+19);
                  f(i+12,j:j+19);f(i+13,j:j+19);f(i+14,j:j+19);f(i+15,j:j+19);
                  f(i+16,j:j+19);f(i+17,j:j+19);f(i+18,j:j+19);f(i+19,j:j+19)
                 ];
            
           B1=num2str(S);
             D1=strcat(A1,B1,C1);
             imwrite(plate,D1);
             count=count+1;
       else
           break;
     
       end
       S=S+1;
%        fv=Hist_Equalization(CorrectLight(plate));
%        fv(1,1:4)=0;fv(1,17:20)=0;fv(2,1:3)=0;fv(2,18:20)=0;
%        fv(3,1:2)=0;fv(3,19:20)=0;fv(4,1)=0;fv(4,20)=0;
%        fv(17,1)=0;fv(17,20)=0;fv(18,1:2)=0;fv(18,19:20)=0;
%        fv(19,1:3)=0;fv(19,18:20)=0;fv(20,1:4)=0;fv(20,17:20)=0;
%        
%        rfv=reshape(fv,[1,400]);
%        I=sim(net,rfv');
%        vector=[vector,I];

 
       
    end
end
