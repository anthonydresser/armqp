%%AR MQP - Anthony Dresser, Lukas Hunker, Andrew Weiler
%% BarrelProj.m
%This function builds a LUT for DK2 Barrel projection on 1080x960 images.
%Each indicie of the LUT indicates the source pixel at that indicie

function [LUT] = BarrelProj()

width=960;
height=1080;

xmid=width/2;
ymid=height/2;

rMax=sqrt(xmid^2+ymid^2);

LUT=uint16(zeros(width, height, 2));

for y=1:height
    for x=1:width
        pr=sqrt((xmid-x)^2+(ymid-y)^2);
        
        newR=calcRadius( pr, rMax );

        alpha=atan2(-(y-ymid),-(x-xmid));
        newx = abs(cos(alpha)*(newR-xmid));
        newy = abs(sin(alpha)*(newR-ymid));
        gnRadius = sqrt(power(xmid-newx,2)+power(ymid-newy,2));
        
        if(floor(gnRadius)==floor(newR)&&round(newx)<=width&&round(newy)<=height)
            LUT(round(newx)+1,round(newy)+1,:)=[x y];
        end
    end
end

end

