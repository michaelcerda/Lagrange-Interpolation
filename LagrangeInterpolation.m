clc;close all;

%function
f = @(x) 1./(1+10*x.^2);

%data for x and f(x)
X = -1:0.2:1;
Y = f(X);

%data for actual function
x = -1:0.01:1;
y = f(x);

%Lagrange Interpolation
Lagrange_Polynomial = Lagrange_Interpolation(X,Y,x);

%Plot of function
plot(x,Lagrange_Polynomial,'r');
hold on
plot(x,y,'b');
hold on
plot(X,Y,'k*');
xlabel('x');
ylabel('f(x)');
legend('Lagrange','Actual','Data Points')

%This file executes Lagrange Interpolation that will output a set of points

function sum = Lagrange_Interpolation(x,y,xx)
n = length(x);
product = ones(n,size(xx,2));
sum = 0;
for i = 1:n
    for j = 1:n
        if i ~= j
            product(i,:) = product(i,:).*(xx-x(j))/(x(i) - x(j));
        end
    end
end
for i = 1:n
    sum = sum + y(i)*product(i,:);
end
end
