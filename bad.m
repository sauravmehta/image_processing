clc;
clear all;
close all;

obj=VideoReader('bad4.mp4')

img=rgb2gray(read(obj,30));

subplot(221)
imshow(img);
impixelinfo;

th=im2bw(img,0.6);

subplot(222)
imshow(th);
impixelinfo;


mask=zeros(360,640);

for i=1:200
    for j=300:350
        mask(i,j)=1;
    end
end

subplot(223)
imshow(mask);
impixelinfo;



el=strel('square',7);

mor=imdilate(th,el);
subplot(224)
imshow(mor);
impixelinfo;


frames=get(obj,'NumberOfFrames');

rallies=0;
k=1;

while(k<=frames)
    img=rgb2gray(read(obj,k));
    
    th=im2bw(img,0.6);
    
    el=strel('square',7);
    
    mor=imdilate(th,el);
    
    count=0;
    
    for i=1:175
        for j=300:350
            if(mor(i,j)==1)
                count=count+1;
            end
        end
    end
    
    if(count>100)
        rallies=rallies+1;
        k=k+5;
    end
    
%     
%     k
%     rallies
    
    k=k+1;
            
end

    
