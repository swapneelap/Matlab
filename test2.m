tic
%cd C:\Users\karthik\Downloads\
global vert
vert=[];
a = imread('foam.jpg');
b = rgb2gray(a);
dim = size(b);
%t = imbinarize(c);
level=graythresh(b);
c=im2bw(b,level);
d = imcomplement(c); 
e = bwmorph(d,'shrink',inf);
f = 255*uint8(e);
cord_vert=[];
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
            cord_vert=[cord_vert ; [i j]];
        end
    end
end
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