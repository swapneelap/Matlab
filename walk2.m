function out = walk2(x,y,img)
count1=0;
for p = (x-1):(x+1)
	stp=0;
	for q = (y-1):(y+1)
		if img(p,q)==150
			out=[p,q]
			stp=1;
		elseif img(p,q)==255
			count1=count1+1;
		end
	end
	if stp==1
		break
	end
end
if count1<=2
	for a = (x-1):(x+1)
		for b = (y-1):(y+1)
			if a~=x || b~=y
				walk(a,b,img)
			end
		end
	end
end
end