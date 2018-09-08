%%%This code is to generate vectorized data

A=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\PositiveRotate\');
%读入路劲
C=('.bmp');
%读入格式

%%  PositiveData Vector Generation
% for i=1:4200
% %for i=1:100
% 
% B=num2str(i);
% D=strcat(A,B,C);
% I=imread(D);
% 
% Vec=reshape(I,[400 1]);
% 
% if i==1
%     VecN=Vec;
% else
%     VecN=[VecN,Vec];
% end
% 
% end
%VecN=[VecN,NegSet];
%% NegativeData Vector Generation

A=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\SlidingWindowTem1\');
C=('.bmp');
for i=1:7920
    B=num2str(i);
D=strcat(A,B,C);
I=imread(D);

Vec=reshape(I,[400 1]);
if i==1
    VecNeg=Vec;
else
    VecNeg=[VecNeg,Vec];
end
end
VecNeg=[VecNeg,NegSet];
%% 目标向量

 Out=zeros(1,14120);
for i=1:4200
    Out(i)=1;
end
for i=4201:14120
    Out(i)=0;
end

%%
VecN=[VecN,VecNeg];