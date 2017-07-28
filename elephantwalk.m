%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                         ELEPHANT WALK AND CHECK FUNCTION                                             
% The name of the function is based on the way function mounts itself which is mimicking the "Rook" in chess which in 
% Gujarati is Elephant so Elephantwalk. So it moves like a Rook but surches for vertex(150) in all directions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [out] = elephantwalk(x,y,image)
set(0,'RecursionLimit',1000)
global stack1; % The output of the function will go to the veriable stack1.
global img;
img = image;
img(x,y) = img(x,y) + 1;
for i = (x-1):(x+1)
	for j = (y-1):(y+1)
		if img(i,j)==150
			img(i,j)=img(i,j)+1;
			stack1=[stack1 ; [i j]];
		end
	end
end
for p = [[x;(y-1)] [x;(y+1)] [(x-1);y] [(x+1);y]]
	if img(p(1),p(2))==0
		elephantwalk(p(1),p(2),img)
	end
end
