close all;
clc;

[zz xx]=size(MP);
J=zeros(zz,xx);

for iii=1:zz
    for jjj=1:xx
        
     if MP(iii,jjj)>0.99
         J(iii,jjj)=1;

%           rectangle('Position',[j*ratio,i*ratio,20*ratio,20*ratio],'edgecolor',[0.93 0.78 0.06],'LineWidth',2);
           
     end
     
       
     
       end
      
       %S=S+1;
             %f=imresize(rgb2gray(I),[20,20]);

      
end


se=[0,1,0;
    1,1,1;
    0,1,0];

Ff=imerode(J,se);



% R=imopen(Ff,se));
% R=imclose(R,se);
% 
% B1=strel([1 0; 
%           0 1 ]);
% B2=strel([0 0 ; 
%           0 0 ;]);
% 
% nMP=bwhitmiss(J,B1,B2);


figure,subplot(1,2,1);imshow(J);
subplot(1,2,2);imshow(Ff);



figure,imshow(Image1);
[pp qq]=size(Ff);

point=0;
for vv=1:pp
    for cc=1:qq
        if Ff(vv,cc)==1
       
            rectangle('Position',[cc*ratio,vv*ratio,20*ratio,20*ratio],'edgecolor',[0.93 0.78 0.06],'LineWidth',2);
            point=point+1;
        end
    end
end