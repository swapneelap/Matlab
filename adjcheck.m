function [out] = adjcheck(x,y,img)
collect = 0;
for j = y-1 : y+1
	if img(x-1,j)==255 && img(x,j)==255 && j~=y
		collect = 0;
		break
	elseif img(x,j)==255 && img(x+1,j)==255 && j~=y
		collect = 0;
		break
	end
	if img(x-1,j)==255 && img(x-1,j+1)==255 && j~=y+1
		collect = 0;
		break
	elseif img(x+1,j)==255 && img(x+1,j+1)==255 && j~=y+1
		collect = 0;
		break
	else
		collect = 1;
	end
end
out = collect;
end
