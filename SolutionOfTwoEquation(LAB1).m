a = [1,1;1,-1];
b = [3;1];
if det(a) ~= 0
    X = inv(a) * b;
    final = sum(X,2)
else
    fprintf('determinant is zero');
end
 
X2 = linspace(1,20);
x1 = 3-X2;
y1 = 1 + X2;
 
plot(X2,x1);
hold on
plot(y1,X2);
grid on
plot(2,1,'+')
