cd C:\Users\karthik\Downloads\
b = imread('foam.jpg');
c = rgb2gray(b);
d=zeros(361,481);

for i = 1:360;
    for j = 1:480;
        if c(i,j) < 160;
            d(i,j) = 0;
        else
            d(i,j) = 255;
        end
    end
end

for i = 1:360;
    for j = 1:480;
        if d(i,j)==0 && d(i,j+1)==0;
            if d(i+1,j)==0 && d(i-1,j)==0;
                if d(i+1,j+1)==255 && d(i-1,j+1)==255;
                    
                else
                    d(i,j+1)=255;
                end
            end
        end
    end
end

for j = 1:480;
    for i = 1:360;
        if d(i,j)==0 && d(i+1,j)==0;
            if d(i,j+1)==0 && d(i,j-1)==0;
                if d(i+1,j+1)==255 && d(i+1,j-1)==255;
                    
                else
                    d(i+1,j)=255;
                end
            end
        end
    end
end

% 
% for i = 1:360;
%     for j = 1:480;
%         if d(i+1,j)==0 && d(i+1,j+1)==0 && d(i,j+1)==0;
%             d
%             
%         else
%             d(i,j) = 255;
%         end
%     end
% end


% Improper method with respect black blocks
for i = 2:360;
    for j = 2:480;
        if d(i+1,j+1)~=150 && d(i+1,j-1)~=150 && d(i-1,j-1)~=150 && d(i-1,j+1)~=150% && d(i+2,j)~=150 && d(i-2,j)~=150  
            if d(i+1,j)==0 && d(i,j+1)==0 && d(i,j-1)==0;
                d(i,j) = 150;
            elseif d(i+1,j)==0 && d(i,j-1)==0 && d(i-1,j)==0;
                d(i,j) = 150;
            elseif d(i-1,j)==0 && d(i,j+1)==0 && d(i,j-1)==0;
                d(i,j) = 150;
            elseif d(i-1,j)==0 && d(i,j+1)==0 && d(i+1,j)==0;
                d(i,j) = 150;
            end
        end
    end
end

e = uint8(d);
imtool(e)