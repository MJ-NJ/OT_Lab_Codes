------------ GRAPHICAL METHOD ---------------------------
clear
a = [2 4;3 5;1 0;0 1];
b = [8;15;0;0];

% This is to remove x1, x2 constraints
% Solving equation
x1 = [];
ind1=0;
for i = 1:length(b)
    for j = i+1:length(b)
        asub = a([i, j], :);
        bsub = b([i, j], :);
        if det(asub) ~= 0
            ind1=ind1+1;
            x = inv(asub) * bsub;
            x1 = [x1, x];
        end
    end
end
% Checking constraints
k=[];
for j=1:ind1
    if all(x1(:,j)>= 0)
        k = [k x1(:,j)];
        asub = a(1:end-2, :);
        bsub = b(1:end-2, :);

        c = [];
        for i=1:size(k,2)
            if (asub * k(:, i)) - bsub <= 0
                 c = [c, k(:, i)];
            end
        end
    end
end
   

if ~isempty(c)
    z = [3 2] * c;
    [zmax, imax] = max(z);

    for i = 1:length(b)
        if a(i, 2) ~= 0
            x = [-5:0.1:max(b) + 1];
            y = (b(i) - a(i, 1) * x) / a(i, 2);
            plot(x, y);
            hold on;
        else
            y = [-5:0.1:max(b) + 1];
            x = b(i) * ones(size(y)) / a(i, 1);
            plot(x, y);
            hold on;
        end
    end

    for i = 1:size(c, 2)
        plot(c(1, i), c(2, i), 'x');
        hold on;
    end
    plot(c(1, imax), c(2, imax), 'o');

    disp('Maximum objective value: ');
    disp(zmax);
    disp('Point with maximum objective value: ');
    disp(c(:,imax));
else
    disp('No feasible solutions.');
end

-------------------------- BASIC FEASIBLE SOLUTION -----------------------------------------------

clear 
a = [1 0 0 1 0 0 0 ; 0 1 0 0 1 0 0 ; -1 1 0 0 0 1 0 ; -1 0 2 0 0 0 1];
b = [4;4;6;4];

n = length(a);
m = length(b);

nbs = nchoosek(n,m);
d = nchoosek(1:n,m);

xsol = [];
for i=1:nbs
    asub =[];
    index = d(i,:);
    for j=1:m
        asub = [asub a(:,index(j))];
    end
    x = zeros(n,1);
    if det(asub) ~= 0
        xbv = inv(asub)*b;
        x(index) = xbv;
        if x >= 0
             disp("got feasible sol");
            xsol = [xsol x];
        else
            disp("not feasible sol");
        end
    end
end

disp(xsol.');