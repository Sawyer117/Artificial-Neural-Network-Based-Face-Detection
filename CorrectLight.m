function [ output_Image] = Correct_Light( input_Image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 %读入一张有颜色的图片
g=input_Image;
%f=rgb2gray(g);     %将其转换为灰度值
[m n]=size(g);

vec_x=zeros(fix(m/5));
vec_y=zeros(fix(n/5));

sam_x=1:2:m;
vec_x=double((g(sam_x,ceil(n/2))).');
sam_y=1:2:n;
vec_y=double(g(ceil(m/2),sam_y));

% subplot(2,2,1),plot(sam_x,vec_x);
% subplot(2,2,3),plot(sam_y,vec_y);

k=1;
A_x=polyfit(sam_x,vec_x,k);  %n是给定的多项式的次数，拟合出来的结果A是系数向量
y_x=polyval(A_x,sam_x);  %计算出拟合的y值

A_y=polyfit(sam_y,vec_y,k);
y_y=polyval(A_y,sam_y);

% subplot(2,2,2),plot(sam_x,vec_x,'k*',sam_x,y_x,'r-');  %画出数据对比图，黑点是原始数据，红线是拟合曲线%指定函数拟合
% subplot(2,2,4),plot(sam_y,vec_y,'k*',sam_y,y_y,'r-');  %画出数据对比图，黑点是原始数据，红线是拟合曲线%指定函数拟合
    
x=1:1:m;
y=1:1:n;
[a,b]=meshgrid(x,y);
Pw_x=ones(m);
Pw_y=ones(n);
Pw=Pw_x.*((Pw_y).');
for i=1:m
    for j=1:n
        Pw(i,j)=(A_x(1)*j+A_y(1)*i);
    end
end
Pw=Pw.';
bc=min(min(Pw));
for ii=1:m
    for jj=1:n
        Pw(ii,jj)=Pw(ii,jj)+abs(bc);
    end
end
% figure,subplot(2,2,1),mesh(Pw);
Pw=imcomplement(uint8(Pw));
% subplot(2,2,2),imshow(Pw);
% subplot(2,2,3),imshow(f);

for iii=1:m
    for jjj=1:n
        g(iii,jjj)=0.7.*g(iii,jjj)+0.3.*Pw(iii,jjj);
    end;
end;
% subplot(2,2,4),imshow(f);

output_Image=g;



end

