close all;
clc;

[zz xx]=size(MP);
J=zeros(zz,xx);

for iii=1:zz
    for jjj=1:xx
        
     if MP(iii,jjj)>0.98
         J(iii,jjj)=1;
     end
     
    end
end


se=[0,1,0;
   0,1,0;
    0,0,0];
    
%     se=[1,0;
%     1,0]
%     

Ff=imerode(J,se);

figure,subplot(1,2,1);imshow(J);
subplot(1,2,2);imshow(Ff);

figure,imshow(Image1);
[pp qq]=size(Ff);
pointer=zeros(1,2);
pointer(1,:)=[];

point=0;

for vv=1:pp
    for cc=1:qq
        if Ff(vv,cc)==1
            vect=[vv cc];
            pointer=[pointer;vect];

        end
    end
end

[s,s1]=size(pointer);

distance=zeros(1,3);
d_for_s=zeros();


for iter=1:s
    dis=sqrt(pointer(iter,1)^2+pointer(iter,2)^2);
    distance=[distance;dis,pointer(iter,1),pointer(iter,2)];
    
    d_for_s=[d_for_s,dis];
    A=sort(d_for_s);
end

 for iter1=1:s
     error=A(iter1+1)-A(iter1);
     if error>1
         for iter2=1:s
             if distance(iter2,1)==A(iter1+1)
                 rol=distance(iter2,2);
                 col=distance(iter2,3);
                    rectangle('Position',[col*ratio,rol*ratio,20*ratio,20*ratio],'edgecolor',[0.93 0.78 0.06],'LineWidth',2);
         
             end

     end
     end
 end
        

     