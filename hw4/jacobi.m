function x= jacobi()
for n = [10,1000,100000]
    for a = [2,2.5,3]
        [A,b] = sparsesetup(a,n);
        [c,Fe,Be,r]=Jacobi(A,b);
        Fe = num2str(Fe);
        Be = num2str(Be);
        r = num2str(r);
        disp( ['a=',num2str(a), '  n=',num2str(n), '  it=',num2str(c), '  err=',Fe, '  res=',Be, '  err/res=',r]);
    end
end
end


function [A,b] = sparsesetup(a,n)
e = ones(n,1);
A = spdiags([-e a*e -e],-1:1,n,n);
b = repmat(a-1,n,1);
b(2:n-1) = a-2;
end

function [c,Fe,Be,r] = Jacobi(A,b)
n = length(b);
D = diag(A);
r = A-diag(D);
x = zeros(n,1);
p = ones(n,1);
i = 0;
Tol = 0.5*10^-6;
while ((max(abs(x-p))) > Tol)&&(i<=1000)
    x = (b-r*x)./D;
    i = i+1;
end
c = i;
Fe = max(abs(x-p));
Be = max(abs(A*x-b));
r = Fe/Be;
end




