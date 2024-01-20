clc
clear all
a = [1,1;1,0;0,1;2,1;1,0;0,1];
b = [800;400;700;1000;0;0];
c = [4,3];
index = 0;
m = length(b);
for i=1:m
    for j=i+1:m
        asub = a([i,j],:);
        bsub = b([i,j]);
        if det(asub)~=0
            x = inv(asub)*bsub;
            index = index + 1;
            V(index,:) = x;
        end
    end
end
V = transpose(V);
if V>=0
    asub = a(1:m-2,:);
    bsub = b(1:m-2);
    index1 = 0;
    for i = 1:index
        if asub*V(:,i)-bsub <= 0
            index1 = index1 + 1;
            D(:,index1) = V(:,i);
        end
    end
end
Z = c * D;
[zmax,imax] = max(Z);
disp(zmax);
disp(imax);