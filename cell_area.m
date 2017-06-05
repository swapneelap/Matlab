function out = cell_area(x,y,image)
cellar=0;
vertices = vertex(x,y,image)
for i = 1:length(vertices(:,1))
	if i ~= length(vertices(:,1))
		cellar = cellar + (vertices(i,1).*vertices(i+1,2)) - (vertices(i+1,1).*vertices(i,2));
	else
		cellar = cellar + (vertices(i,1).*vertices(1,2)) - (vertices(1,1).*vertices(i,2));
	end
end
out = abs(cellar./2);
