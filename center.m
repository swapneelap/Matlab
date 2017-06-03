tic
global stack1;
global img
a = rgb2gray(imread('foam.jpg'));
dim = size(a);
level = graythresh(a);
b = im2bw(a,level);
c = imcomplement(b);
d = bwdist(c);
for i=1:dim(1)
	for j=1:dim(2)
		if d(i,j)<=1
			d(i,j)=0;
		end
	end
end
e = logical(d);
f = bwmorph(e,'shrink',inf);
g = bwmorph(c,'shrink',inf);
final = 255*uint8(g);
for i=2:dim(1)-1
    for j=2:dim(2)-1
        count=0;
        for m=(i-1):(i+1)
            for n=(j-1):(j+1)
                if final(m,n)==255 && final(i,j)~=0
                    count=count+1;
                end
            end
        end
        if count>=4 && final(i-1,j-1)~=150 && final(i,j-1)~=150 && final(i+1,j-1)~=150 && final(i-1,j)~=150 && final(i+1,j)~=150 && final(i-1,j+1)~=150 && final(i,j+1)~=150 && final(i+1,j+1)~=150
            final(i,j)=150;
        end
    end
end
h = final + (100*uint8(f));
imtool(h)
toc
