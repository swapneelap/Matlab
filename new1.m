tic
a=imread('cells.tif');
dim=size(a);
level=graythresh(a);
b=im2bw(a,0.33);
s0=strel('line',4,0);
s90=strel('line',4,90);
c=imdilate(b,[s0 s90]);
d=imfill(c,'holes');
imtool(d)
toc