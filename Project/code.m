clc;
clear all;
close all;

% Read the colour image
Img = imread('Image1.jpg');

% Convert the colour image to grayscale image
gray = rgb2gray(Img);

% Extract the size of the gray scale image
s = size(gray);

% Resize the colour image to store values of pixels after binning
image = imresize(Img,[(s(1)/2) (s(2)/2)]);

t1=1;
t2=1;
i=1;
j=1;
k=1;

% Perform 4-1 pixel binning for each layer of colour image
while(k<=3)
    while(i<=s(2))
        while(j<=s(1))
            t3 = [Img(i,j,k) + Img(i,j+1,k) + Img(i+1,j,k) + Img(i+1,j+1,k)]/4;
            image(t1,t2,k) = 0;
            image(t1,t2,k) = image(t1,t2,k) + t3;
            j=j+2;
            t2=t2+1;
        end
        i=i+2;
        t1=t1+1;
    end
    k=k+1;
end

subplot(2,2,2), imshow(image), title('Colour image after pixel binning')
subplot(2,2,1),imshow(Img), title('Original colour image')
subplot(2,2,3),imshow(gray), title('Original gray scale image')

temp1=1;
temp2=1;

% Resize the gray scale image to store the values of pixels after binning
bin = imresize(gray,[(s(1)/2) (s(2)/2)]);
i=1;
j=1;

% Perform 4-1 pixel binning for the gray scale image
while(i<=s(2))
    while(j<=s(1))
        temp3 = [gray(i,j) + gray(i,j+1) + gray(i+1,j) + gray(i+1,j+1)]/4;
        bin(temp1,temp2) = 0;
        bin(temp1,temp2) = bin(temp1,temp2) + temp3;
        j=j+2;
        temp2=temp2+1;
    end
    i=i+2;
    temp1=temp1+1;
end
subplot(2,2,4),imshow(bin), title('Gray scale image after pixel binning')