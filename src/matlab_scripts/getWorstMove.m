%%AR MQP - Anthony Dresser, Lukas Hunker, Andrew Weiler
%% getWorstMove.m
%	finds the longest move opperation infered by a LUT, assuming row major
%	order in a storage array

function [ worst_num_pixels ] = getWorstMove( LUT )

[width, height, components]=size(LUT);

worst_num_pixels=0;

for y=1:height
    for x=1:width
        deltaY=abs(y-LUT(x,y,2));
        deltaX=abs(x-LUT(x,y,1));
        moveDistance=deltaY*width+deltaX;
        if(moveDistance>worst_num_pixels)
            worst_num_pixels=moveDistance;
            fprintf('New Worst Move Found: Dist %d, From x=%d  y=%d to x=%d y=%d\n', moveDistance, LUT(x,y,1), LUT(x,y,2), x, y);
        end
    end
end


end

