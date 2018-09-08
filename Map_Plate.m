clc;
close all;
clear all;

g=imread('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\TestTem\7.jpg');
Image1=rgb2gray(g);
imshow(g);
rect=getrect;
ratio=max(rect(3),rect(4))/20;
f=imresize(Image1,1/ratio);
[n,m]=size(f);

load('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NetWorkDataFile\net100.mat');
load('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NetWorkDataFile\Nnet100.mat');

Gap=2;

plate=zeros(20);
vector=zeros(1);
MP=zeros(n,m);
s=0;




for i=1:Gap:n
    for j=1:Gap:m
        
       if ((i+19+Gap<n)&&(j+19+Gap<m))
           
            plate=f(i:i+19,j:j+19);
            s=s+1

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
         y1=sim(Nnet100,I1);
         y2=sim(net100,I1);
         y=0.5*y1+0.5*y2;
         MP(i,j)=y;

         if y>0.99       
            rectangle('Position',[j*ratio,i*ratio,20*ratio,20*ratio],'edgecolor',[0.93 0.78 0.06],'LineWidth',2);
         end
     
       end   
    end
end


vector(1,:)=[];

