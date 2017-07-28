%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                 WALK FUNCTION
% The function mounts itself on white(255) pixels and breaks when it hits a gray(150) pixel and outputs
% the coordinates of that pixel.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function a=walk(x,y,om)
global k
k = om; % This the image to be used in the function.
k(x,y)=k(x,y)-1;
for p=(x-1):(x+1)
    stp=0;
     for q=(y-1):(y+1)
         if k(p,q)==255
            k(p,q)=k(p,q)-1;
            walk(p,q,k)
        elseif k(p,q)==150
            k(p,q)=k(p,q)-1;
            a=[p,q];
            stp=1;
            break
         end
     end
    if stp==1
            break
    end
end
end              
