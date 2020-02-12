function v=bit2num(x)
if x==num2bitchar(nan)
    v=NaN;
    disp(v);
else
    a=str2double(x(1));
    c=x(2:12);
    e=bin2dec(c)-1023;
    m=1;
for i=1:52
    n=2^(-i)*str2double(x(i+12));
    m=m+n;
end
v=(-1)^a*2^e*m;
end

disp("The value is: ");
disp(v);

