File1 = fopen('coordinate.txt','w');
for p = 1:size(cord_vert(:,1))
	fprintf(File1,'%d %d %d\n',cord_vert(p,:));
end
fclose(File1);
File2 = fopen('edges.txt','w');
for p = 1:size(lines(:,1))
	fprintf(File2,'%d %d %d\n',lines(p,:));
end
fclose(File2);
