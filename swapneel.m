global points
global lines
global check
for q=1:length(cord_vert)
    edge(cord_vert(q,2),cord_vert(q,3),om)
    %[cord_vert(q,2) cord_vert(q,3)]
    %points
    for p=1:length(points)
        check = 0;
        l=find(cord_vert(:,2)==points(p,1) & cord_vert(:,3)==points(p,2));
        if size(lines,1)~=0
            for s=1:size(lines,1)
                if [lines(s,2) lines(s,3)] == [l cord_vert(q)]
                    check = 1;
                    break
                end
            end
        end
        if check ~= 1
            lines=[lines;[size(lines,1)+1 cord_vert(q) l]];
        end
    end
    points=[];
end
