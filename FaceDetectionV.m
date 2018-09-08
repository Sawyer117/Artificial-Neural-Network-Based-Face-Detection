%[filename, pathname] = uigetfile( '*.jpg;*.png', '开始');
A1=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\CrossValidationSet(1)\PositiveSet\');
A2=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\CrossValidationSet(1)\NegativeSet\');
load('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\NetWorkDataFile\net200.mat');
%%%%%%%%%%%
%NetName=('net10');
PosNum=50;
NegNum=81;
Vset=zeros(PosNum+NegNum,2);
p=1;
%% Validation for Positive
for i=1:PosNum
%i=5;
B=num2str(i);
C=('.jpg');
D=[A1,B,C];
I=imread(D);
%% preprocessing
f=imresize(rgb2gray(I),[20,20]);
fv=Hist_Equalization(CorrectLight(f));
       fv(1,1:4)=0;fv(1,17:20)=0;fv(2,1:3)=0;fv(2,18:20)=0;
       fv(3,1:2)=0;fv(3,19:20)=0;fv(4,1)=0;fv(4,20)=0;
       fv(17,1)=0;fv(17,20)=0;fv(18,1:2)=0;fv(18,19:20)=0;
       fv(19,1:3)=0;fv(19,18:20)=0;fv(20,1:4)=0;fv(20,17:20)=0;
       
      
       %% 
I=reshape(fv,[400 1]);

y=sim(net200,I);
Vset(p,2)=y;

if y<0.5;
    Vset(p,1)=i;
    %Vset(p,2)=y;
    %p=p+1;
end
p=p+1;
%%
end

%%
p=p+1;
for i=1:NegNum
%i=5;
B=num2str(i);
C=('.jpg');
D=[A2,B,C];
I=imread(D);


%% 
f=imresize(rgb2gray(I),[20,20]);
fv=Hist_Equalization(CorrectLight(f));
       fv(1,1:4)=0;fv(1,17:20)=0;fv(2,1:3)=0;fv(2,18:20)=0;
       fv(3,1:2)=0;fv(3,19:20)=0;fv(4,1)=0;fv(4,20)=0;
       fv(17,1)=0;fv(17,20)=0;fv(18,1:2)=0;fv(18,19:20)=0;
       fv(19,1:3)=0;fv(19,18:20)=0;fv(20,1:4)=0;fv(20,17:20)=0;
       %% 
       I=reshape(fv,[400 1]);
y=sim(net200,I);
Vset(p,2)=y;

if y>0.5;
    Vset(p,1)=i;
   %Vset(p,2)=y;
    %p=p+1;
end
p=p+1;
end