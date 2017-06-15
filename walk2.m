function [out] = walk2(x,y,image)
% One thing i can think of right now is putting img as a global veriable
set(0,'RecursionLimit',1000)
global img
global stack1
img = image; 
count1 = 0;
img(x,y)=img(x,y)+1;
for p = (x-1):(x+1)
	stp=0;
	for q = (y-1):(y+1)
		if img(p,q)==150
			out=[p,q];
			img(p,q)=img(p,q)+1;
			stp=1;
			imtool(img)
			break
		elseif img(p,q)==255
			count1=count1+1;
		end
	end
	if stp==1
		break
	end
end
if count1<2 && stp~=1
	for a = (x-1):(x+1)
		for b = (y-1):(y+1)
			if img(a,b)==0
				walk2(a,b,img)
			end
		end
	end
else
       	swapneel=1
	elephantwalk(x,y,img);
	out = stack1;
end
end
