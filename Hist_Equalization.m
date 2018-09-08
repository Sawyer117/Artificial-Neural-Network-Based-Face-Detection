function [ output_Image ] = Hist_Equalization( input_Image )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

f=input_Image;  
g= f; %灰度化后的数据存入数组   

[h,w]=size(g);  
p=zeros(1,256); %预创建存放灰度出现概率的向量  

for i=1:h
    for j=1:w
        p(g(i,j)+1)=p(g(i,j)+1)+1;
    end
end

s=zeros(1,256);  
s(1)=p(1);  

for i=2:256  
   s(i)=p(i) + s(i-1); %统计图像中<每个灰度级像素的累积个数，s(i):0,1,```,i-1  
end

for i=1:256
    s(i) = s(i)*256/(w*h); %求灰度映射函数  
    if s(i) > 256  
        s(i) = 256;  
    end  
end  

%图像均衡化  
f_equal = g;  
for i=1:h 
    for j=1:w 
        f_equal(i,j) = s( f(i,j) + 1);  
    end  
end  
% figure,imshow(f_equal)                           %显示均衡化后的图像   

output_Image=f_equal;


end

