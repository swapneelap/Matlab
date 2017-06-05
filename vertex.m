function out = vertex(x,y,image)
global stack1
global xmin
global xmax
inter=[];
elephantwalk(x,y,image)
unsorted_mat= stack1
xmin = min(unsorted_mat(:,1));
xmax = max(unsorted_mat(:,1));
[~, indexi] = ismember(xmin,unsorted_mat);
sorted_mat = [xmin unsorted_mat(indexi,2)];
unsorted_mat(indexi,:) = [];
xmin = min(unsorted_mat(:,1));
[~, indexi] = ismember(xmin,unsorted_mat);
if unsorted_mat(indexi,2) < sorted_mat(1,2)
	sorted_mat = [sorted_mat ; [xmin unsorted_mat(indexi,2)]];
	unsorted_mat(indexi,:) = [];
	for i = 1:length(unsorted_mat(:,1))
		xmin = min(unsorted_mat(:,1));
		[~, indexi] = ismember(xmin,unsorted_mat);
		if unsorted_mat(indexi,2) < sorted_mat(1,2)
				sorted_mat = [sorted_mat ; [xmin unsorted_mat(indexi,2)]];
				unsorted_mat(indexi,:) = [];
		else
			inter = [inter ; [xmin unsorted_mat(indexi,2)]];
			unsorted_mat(indexi,:) = [];	
		end
	end
	for j = 1:length(inter(:,1))
		xmax = max(inter(:,1));
		[~, indexi] = ismember(xmax,inter);
		sorted_mat = [sorted_mat ; [xmax inter(indexi,2)]];
		inter(indexi,:) = [];
	end
	out = sorted_mat;
elseif unsorted_mat(indexi,2) > sorted_mat(1,2)
	sorted_mat = [sorted_mat ; [xmin unsorted_mat(indexi,2)]];
	unsorted_mat(indexi,:) = [];
	for i = 1:length(unsorted_mat(:,1))
		xmin = min(unsorted_mat(:,1));
		[~, indexi] = ismember(xmin,unsorted_mat);
		if unsorted_mat(indexi,2) > sorted_mat(1,2)
				sorted_mat = [sorted_mat ; [xmin unsorted_mat(indexi,2)]];
				unsorted_mat(indexi,:) = [];
		else
			inter = [inter ; [xmin unsorted_mat(indexi,2)]];
			unsorted_mat(indexi,:) = [];	
		end
	end
	for j = 1:length(inter(:,1))
		xmax = max(inter(:,1));
		[~, indexi] = ismember(xmax,inter);
		sorted_mat = [sorted_mat ; [xmax inter(indexi,2)]];
		inter(indexi,:) = [];
	end
	out = sorted_mat;
end
stack1 = [];
end
