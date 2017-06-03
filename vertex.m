function out = vertex(x,y,image)
global stack1
elephantwalk(x,y,image)
a = stack1;
xmin = min(stack1(:,1));
xmax = max(stack1(:,1));
[tj index] = ismember(xmin,stack1);
b = [xmin stack1(index,2)]

stack1 = [];
end
