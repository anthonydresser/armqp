%%AR MQP - Anthony Dresser, Lukas Hunker, Andrew Weiler
%% doLUT.m
%	doLUT preforms the LUT opperation on an image, tranforming Iin to Iout using LUT

function [Iout] = doLUT(Iin, LUT)


[width, height, components]=size(Iin);

Iout=uint8(zeros(width, height, components));

if(width~=960||height~=1080||components~=3)
    disp('The input picture dimensions are wrong!');
    return;
end

if(any(any(any(LUT==0))))
    disp('Cannot doLUT. LUT still has zeros in it! Returing black');
    return;
end

for y=1:height
    for x=1:width
       % [LUT(x,y,1) LUT(x,y,2)]
        Iout(x,y,:)= Iin(LUT(x,y,2),LUT(x,y,1),:);
    end
end
end

