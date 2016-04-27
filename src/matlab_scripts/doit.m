%%AR MQP - Anthony Dresser, Lukas Hunker, Andrew Weiler
%% doit.m
%% Performs barrel projection on an image and writes it back out to a file

Iin=imread('Koala.jpg');
LUT = BarrelProj();

while any(any(any(LUT==0)))%Keep passing to filter until all zeros have been massaged out
    LUT = GapFilter(LUT);
 end

Iout=doLUT(Iin,LUT);
imwrite(Iout, 'KoalaOut.bmp');
csvwrite('LookUpTable.csv', LUT);