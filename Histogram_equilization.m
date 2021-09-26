close all;
clear all;
clc
%i = imread('image_rgb_2.png');
%i = im2double(i);
%Img_grey = .299*i(:,:,1) + .587*i(:,:,2) + .114*i(:,:,3);  % no need for loops
%imshow(Img_grey);
tic;
Img_grey=imread('P1_university.png');
numofpixels=size(Img_grey,1)*size(Img_grey,2);
figure,imshow(Img_grey);
title('Original Image');
HIm=uint8(zeros(size(Img_grey,1),size(Img_grey,2)));
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);
n=1:256;
%freq counts the occurrence of each pixel value.

%The probability of each occurrence is calculated by probf.

%tic;
for i=1:size(Img_grey,1)

    for j=1:size(Img_grey,2)

        value=Img_grey(i,j);

        freq(value+1)=freq(value+1)+1;

        probf(value+1)=freq(value+1)/numofpixels;
        

    end

end
%toc;
figure,stem(n,probf)
title('Probability Distribution Function')

sum=0;

no_bins=255;


%The cumulative distribution probability is calculated. 
%tic;
for i=1:size(probf)

   sum=sum+freq(i);

   cum(i)=sum;

   probc(i)=cum(i)/numofpixels;

   output(i)=round(probc(i)*no_bins);

end
%toc;
cum
figure,stem(n,output)
%tic;
for i=1:size(Img_grey,1)

    for j=1:size(Img_grey,2)

            HIm(i,j)=output(Img_grey(i,j)+1);

    end

end
toc;
figure,imshow(HIm);
title('Histogram equalization');



