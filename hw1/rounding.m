disp('bit 53 is 0:') 
disp(['fl(1+(2^-54))=', num2bitchar(1+(2^-54)),'_2']) 
disp('rounding down, bit 52 stays zero')

disp('bit 53 is 0:') 
disp(['fl(1+(2^-53))=', num2bitchar(1+(2^-53)),'_2']) 
disp('rounding down, bit 52 stays zero')

disp('bit 53 is 1:') 
disp(['fl(1+(2^-53+2^-54))=', num2bitchar(1+(2^-53+2^-54)),'_2']) 
disp('rounding up, bit 52 becomes 1')

disp('bit 53 is 1:') 
disp(['fl(1+(2^-52+2^-53))=', num2bitchar(1+(2^-52+2^-53)),'_2']) 
disp('rounding up, bit 52 stays zero and bit 53 becomes 1')
