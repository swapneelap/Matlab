global points
global lines
for q=1:length(cord_vert)
    edge(cord_vert(q,2),cord_vert(q,3),om)
    for p=1:length(points)
        l=find(cord_vert(:,2)==points(p,1) & cord_vert(:,3)==points(p,2));
        if size(intersect(lines,[l cord_vert(q)]))~=[1 1]
            lines=[lines;[cord_vert(q) l]];
        end
    end
    points=[];
end
