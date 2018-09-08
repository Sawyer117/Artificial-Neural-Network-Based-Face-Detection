%To generate a random 20X20 pixels image to be treated as the negative
%training example


for i=1:2000
PseuNeg=randi([1,255],400,1);
PseuNeg=uint8(PseuNeg);
if i==1
    NegSet=PseuNeg;
else
    NegSet=[NegSet,PseuNeg];

end
end

% FF=reshape(PseuNeg,[20 20]);
imshow((PseuNeg));


