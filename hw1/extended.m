e=54;
for i=1:e
    a=(1+(2^-53+2^-e));
        if (a~=1+2^-52)
        disp(e)
        break
        end
        e=e+1;
end

disp('The known bits of CPU have is ')
disp(e-1)
    