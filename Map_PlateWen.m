clc;
close all;
clear all;

g=imread('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\TestTem\8.jpg');
Image1=rgb2gray(g);
imshow(Image1);
rect=getrect;
ratio=max(rect(3),rect(4))/20;
f=imresize(Image1,1/ratio);
[n,m]=size(f);

load('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NetWorkDataFile\net100.mat');
load('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NetWorkDataFile\Nnet100.mat');

Gap=1;

plate=zeros(20);
vector=zeros(1);
MP=zeros(n,m);
s=0;

%% 
SavePosition=zeros(n,2); %%%% New
countFacePosition=1;     %%%% New
%% 


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
            SavePosition(countFacePosition,1)=j*ratio;  %%%% New
            SavePosition(countFacePosition,2)=i*ratio;  %%%% New
            countFacePosition=countFacePosition+1;       %%%% New
         end
     
       end   
    end
end
countFacePosition=countFacePosition-1;
SavePosition1=SavePosition(1:countFacePosition,:); %%%% New
[row,~]=size(SavePosition1);                     %%%% New
MergePosition=zeros(row,2);
MergePosition(1,:)=SavePosition1(1,:);
MergeNumberMatrix=zeros(row,1);
%pause

 
%  ClusterNo=1;
%  rowcurrent=1;
%  rowNow=2;
%  while(1)
%      [row,~]=size(SavePosition1);
%      if rowNow>row
%          break;
%      end
%      current=SavePosition1(rowcurrent,:);
%      Now=SavePosition1(rowNow,:);
%      if abs(current-Now)<20*ratio
%          if abs(current-Now)<20*ratio
%             MergePosition(ClusterNo,:)=MergePosition(ClusterNo,:)+Now;
%             MergeNumberMatrix(ClusterNo)=MergeNumberMatrix(ClusterNo)+1;
%             SavePosition1(rowNow,:)=[];
% %            
%          else
% %             
%              MergePosition(ClusterNo,:)=MergePosition(ClusterNo,:)+current;
%              SavePosition1(rowcurrent,:)=[];
%              rowcurrent=1;
%              rowNow=2;
%              ClusterNo=ClusterNo+1;
%          end
% %         
%      end
%      rowcurrent=rowcurrent+1;
%      rowNow=rowNow+1;
%  end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [row1,~]=size(MergePosition);
% for ppp=1:row1
% MergePosition(ppp,:)=MergePosition(ppp,:)./MergeNumberMatrix(ppp);
% end
% 
% cla;
% for ppp=1:row1
% rectangle('Position',[MergePosition(ppp,1),MergePosition(ppp,2),20*ratio,20*ratio],'edgecolor',[0.93 0.78 0.06],'LineWidth',2);
% end

 %end



            







