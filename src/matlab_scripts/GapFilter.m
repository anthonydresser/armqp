%%AR MQP - Anthony Dresser, Lukas Hunker, Andrew Weiler
%% GapFilter.m
%Removes zero values from a LUT by using a quazi near neighbor search

function [ LUT_out ] = GapFilter( LUT_in )

[width, height, components]=size(LUT_in);

LUT_out=LUT_in;

for y=1:height
    for x=1:width
        if(LUT_in(x,y,1)==0)
            if(LUT_in(max(min(x-1,width),1),y,1)~=0)%check left 1
                LUT_out(x,y,:)=LUT_in(max(min(x-1,width),1),y,:);
            else if(LUT_in(max(min(x+1,width),1),y,1)~=0) %check right 1
                    LUT_out(x,y,:)=LUT_in(max(min(x+1,width),1),y,:);
                else if(LUT_in(x,max(min(y-1,height),1),1)~=0) %check up 1
                        LUT_out(x,y,:)=LUT_in(x,max(min(y-1,height),1),:);
                    else if(LUT_in(x,max(min(y+1,height),1),1)~=0) %check down 1
                            LUT_out(x,y,:)=LUT_in(x,max(min(y+1,height),1),:);
                        else
                            LUT_out(x,y,:)=[0 0];%failed to find acceptable neighbor. May be fixed in next pass
                        end
                    end
                end
            end
        end
               
    end
end
end

