tic
%%%%%%%%%%%%%%%%%%%% PREPROCESSING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

b = imread('foam.jpg');  % Reading the image, preferably jpg
c = rgb2gray(b);  % converting rgb to gray scale
dim = size(c);  % storing dimentions of the image for future use 
%t = imbinarize(c);
level=graythresh(c);
t=im2bw(c,level);  %converting the image into binary formate
d = imcomplement(t);  % taking complement of the binary image 
e = bwmorph(d,'thin',inf);  %thinning the boundaries
f = 255*uint8(e);  %converting into grayscale again
g=zeros(dim(1),dim(2));

%%%%%%%%%%%%%%%%%%%%%% MARKING THE VERTEX %%%%%%%%%%%%%%%%%%%%%%

for i=2:dim(1)-1
    for j=2:dim(2)-1
        s=0;
        for m=(i-1):(i+1)
            for n=(j-1):(j+1)
                if f(m,n)==255 && f(i,j)~=0
                    s=s+1;
                end
            end
        end
        if s>=4
            f(i,j)=150;
            g(i,j)=150;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%% REMOVING THE REDUNDANT VERTEX %%%%%%%%%%%%

for i=2:dim(1)-1
    for j=2:dim(2)-1
        for m=(i-1):(i+1)
            for n=(j-1):(j+1)
                k=isequal([m,n],[i,j]);
                if f(m,n)==150 && k~=1 && f(i,j)~=0
                    f(i,j)=255;
                end
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%% MARKING THE END POINTS %%%%%%%%%%%%%%%%%%

for i=2:dim(1)-1
    for j=2:dim(2)-1
        s=0;
        for m=(i-1):(i+1)
            for n=(j-1):(j+1)
                if f(m,n)==0 && f(i,j)~=0
                    s=s+1;
                end
            end
        end
        if s==7
            f(i,j)=150;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
om = f;
% g=zeros(dim(1),dim(2));
% for i=1:dim(1)
%     for j=1:dim(2)
%         if f(i,j)==150
%             g(i,j)=f(i,j);
%         end
%     end
% end
imtool(om)
%walk(135,240,om)
toc