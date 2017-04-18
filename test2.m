tic
% Adding
global check
global k
global points
points=[];
global lines
lines=zeros(0,3);
a = imread('foam.jpg');
b = rgb2gray(a);
dim = size(b);
%t = imbinarize(c);
level=graythresh(b);
c=im2bw(b,level);
d = imcomplement(c); 
e = bwmorph(d,'shrink',inf);
f = 255*uint8(e);
global cord_vert
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
        if s>=4 && f(i-1,j-1)~=150 && f(i,j-1)~=150 && f(i+1,j-1)~=150 && f(i-1,j)~=150 && f(i+1,j)~=150 && f(i-1,j+1)~=150 && f(i,j+1)~=150 && f(i+1,j+1)~=150
            f(i,j)=150;
            count=size(cord_vert);
            cord_vert=[cord_vert ; [count(1)+1 i j]];
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
%save vert.txt cord_vert -ASCII %To be used later
toc
