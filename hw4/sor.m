function x = sor()
for omega = [1,1.5,1.9,1.95]
     w=omega;
    for n = [10,1000,100000]
        for a = [2,2.5,3]
            [A,b] = sparsesetup(a,n);
            [c,Fe,Be,r]=Sor(A,b,w);
            Fe = num2str(Fe);
            Be = num2str(Be);
            r = num2str(r);
            disp(['a=',num2str(a),' n=',num2str(n),' omega=',num2str(omega),' it=',num2str(c), ' err=',Fe,' res=',Be,' err/res=',r]);
        end
    end
end
end


function [A,b] = sparsesetup(a,n)
e = ones(n,1);
A = spdiags([-e a*e -e],-1:1,n,n);
b = repmat(a-1,n,1);
b(2:n-1) = a-2;
end


function [c,Fe,Be,r] = Sor(A,b,w)
n = length(b);
D = diag(diag(A));
x = zeros(n,1);
p = ones(n,1);
U = triu(A,1);
L = tril(A,-1);
wLD = w*L+D;
DwL = D+w*L;
i = 0;
Tol = 0.5*10^-6;
while ((max(abs(x-p))) > Tol)&&(i<1000)
    x = wLD\((1-w)*D*x-w*U*x)+w*(DwL\b);
    i = i+1;
end
c = i;
Fe = norm(x-p,inf);
Be = norm(A*x-b,inf);
r = Fe/Be;
end