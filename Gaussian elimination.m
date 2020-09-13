%Set up the matrix Ax = b

A= [1 -2 3;4 10 -20;3 10 15];
b= [5;10;30];

[n,~] = size(A);
x = zeros(n,1);


%Forward Manipulaiton
%Find the multiplier
%manipulate the coeffficient matrix
%
for i = 1:n-1
    m = A(i+1:n,i)/A(i,i);
    A(i+1:n,:) = A(i+1:n,:) - m*A(i,:);
    b(i+1:n,:) = b(i+1:n,:) - m*b(i,:);
end

%Back Subsitution
%First find the solution for x_3 first then plug in to find the first two
%variables
x(n,:) = b(n,:)/A(n,n);
for i = n-1:-1:1
    x(i,:) = (b(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
%display the results
x