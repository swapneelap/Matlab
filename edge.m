function edge(x,y,k)
set(0,'RecursionLimit',5000)
global lines
%k = om;
k(x,y)=k(x,y)-1;
for p=(x-1):(x+1)
    stp=0;
     for q=(y-1):(y+1)
         if k(p,q)==255
            %k(p,q)=k(p,q)-1;
            edge(p,q,k)
        elseif k(p,q)==150
            lines=[lines ; [x,y,p,q]];
            %edge(p,q,k)
            stp=1;
            break
         end
     end
    if stp==1
            break
    end
end
end
