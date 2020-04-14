function x = cg()
for n = [10,1000,100000]
    for a = [2,2.5,3]
        [A,b] = sparsesetup(a,n);
        [c,Fe,Be,r]=Conjugate_gradient(A,b);
         disp( ['a=',num2str(a), '  n=',num2str(n), '  it=',num2str(c), '  err=',num2str(Fe), '  res=',num2str(Be), '  err/res=',num2str(r)]);
      end
end
end


function [A,b] = sparsesetup(a,n)
e = ones(n,1);
A = spdiags([-e a*e -e],-1:1,n,n);
b = repmat(a-1,n,1);
b(2:n-1) = a-2;
end

function [c,Fe,Be,r] = Conjugate_gradient(A,b)
n = length(b);
x = zeros(n,1);
p = ones(n,1);
r1 = b-A*x;
d = r1;
i = 0;
Tol = 0.5*10^-6;
while (norm(x-p,inf) > Tol)&&(i<1000)
    a = (r1.'* r1)/(d.'* A * d);
    x = x + a * d;
    r2 = r1;
    r1 = r1 - a * (A * d);
    beta = (r1.' * r1)/(r2.' * r2);
    d = r1 + beta * d;
    i = i+1;
end
c = i;
Fe = norm(x-p,inf);
Be = norm(A*x-b,inf);
r = Fe/Be;
end