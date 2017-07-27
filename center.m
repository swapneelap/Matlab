%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    CODE TO TAG THE VERTICES AND CENTERS OF THE CELLS                                                         %    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


tic
global stack1;
global img;
image_1 = rgb2gray(imread('foam.jpg'));  % Loading an image and converting to grayscale. Replace 'foam.jpg' with your file.
dim = size(image_1);  % Storing the dimentions of the image for loops later.
level = graythresh(image_1); % Storing gray threshold for convertion to binary for grayscale.
image_2 = im2bw(image_1,level); % Converting to binary.
image_3 = imcomplement(image_2); % Taking the complement of the binary image for shrink.
image_4 = bwdist(image_3); % Calculating the distance between pixels to find centers.

%%%%%%%%%%%%% Running a loop to thicken the boundries of the cells %%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:dim(1)
	for j=1:dim(2)
		if image_4(i,j)<=1 % "1" is very important
			image_4(i,j)=0;
		end
	end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

image_5 = logical(image_4); % Converting to binary.
image_6 = bwmorph(image_5,'shrink',inf); % Shrinking the image to find centers.
image_7 = bwmorph(image_3,'shrink',inf); % Shrinking the image to thin the boundaries of the cells.
image_final = 255*uint8(image_7); % Converting the image back to Grayscale to tag the vertices. 

%%%%%%%%%%%%%% Running the loops to tag the vertices in the images %%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=2:dim(1)-1
    for j=2:dim(2)-1
        count=0;
        for m=(i-1):(i+1)
            for n=(j-1):(j+1)
                if image_final(m,n)==255 && image_final(i,j)~=0
                    count=count+1;
                end
            end
        end
        if count>=4 && image_final(i-1,j-1)~=150 && image_final(i,j-1)~=150 && image_final(i+1,j-1)~=150 && image_final(i-1,j)~=150 && image_final(i+1,j)~=150 && image_final(i-1,j+1)~=150 && image_final(i,j+1)~=150 && image_final(i+1,j+1)~=150 && adjcheck(i,j,image_final)==1
            image_final(i,j)=150; % adjcheck() is a function defined to smoothen the process, the function file contains the discription. 
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

image_out = image_final + (100*uint8(image_6)); % Adding the vertices and center image into one image.
imtool(image_out)
toc
