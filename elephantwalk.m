function [out] = elephantwalk(x,y,image)
set(0,'RecursionLimit',1000)
global stack1;
global img
count1 = 0;
img = image;
img(x,y) = img(x,y) + 1;
for i = (x-1):(x+1)
	for j = (y-1):(y+1)
		if img(i,j)==255
			count1=count1+1;
		end
	end
end
for p = [[x;(y-1)] [x;(y+1)] [(x-1);y] [(x+1);y]]
	if img(p(1),p(2))==150
		img(p(1),p(2))=img(p(1),p(2))+1;
%		out = [p(1) p(2)];
		stack1=[stack1 ; [p(1) p(2)]];
		break
	elseif img(p(1),p(2))==0 && count1>=2
		elephantwalk(p(1),p(2),img)
	end
end
