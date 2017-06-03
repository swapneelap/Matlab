function [out] = elephantwalk(x,y,image)
set(0,'RecursionLimit',1000)
global stack1;
global img
img = image;
img(x,y) = img(x,y) + 1;
for p = [[x;(y-1)] [x;(y+1)] [(x-1);y] [(x+1);y]]
	if img(p(1),p(2))==150
		img(p(1),p(2))=img(p(1),p(2))+1;
		stack1=[stack1 ; [p(1) p(2)]];
		break
	elseif img(p(1),p(2))==0
		elephantwalk(p(1),p(2),img)
	end
end
