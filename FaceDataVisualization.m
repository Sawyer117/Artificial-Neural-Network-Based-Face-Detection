A1=('E:\课程记录\研究生-渥太华大学\2016Winter\ELG7172 Topics in Signal Processing\Project-Face Detection\PositiveTrainingSet(1)\');
Gather=zeros(200,200);

p=1;
row=1;
for i=1:100

B=num2str(i);
C=('.bmp');
D=[A1,B,C];
I=imread(D);
I=double(I);
Gather(row:row+19,p:p+19)=I;
p=p+20;
if p==181
    row=row+20;
    p=1;
end
end
Gather=uint8(Gather);
imshow(Gather);





