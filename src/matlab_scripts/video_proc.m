WIDTH = 1920;
HEIGHT = 1080;
THRESHOLD = 180;
%% Grayscale
% DESCRIPTIVE TEXT

starttime = cputime;
vid = VideoReader('frames/shorter.mp4');
writerObj = VideoWriter('frames/gray.avi');
open(writerObj);
numberOfFrames = vid.NumberOfFrames;
for frame = 1 : numberOfFrames - 1
    thisFrame = read(vid, frame);
    grayImage = rgb2gray(thisFrame);
    writeVideo(writerObj, grayImage);
end
close(writerObj);
disp(strcat('Finished Grey Scale Conversion, took ', num2str(cputime - starttime), ' seconds'));

%% Difference
% DESCRIPTIVE TEXT

starttime = cputime;
vid = VideoReader('frames/gray.avi');
mov = read(vid);
mov_new = diff(mov,1,4)*10;
mov_diff_1 = mov_new;
newVid = VideoWriter('frames/difference.avi');
open(newVid);
writeVideo(newVid, mov_new);
close(newVid);

%% Thresholding
% DESCRIPTIVE TEXT

disp(strcat('processing ', num2str(numberOfFrames), ' frames'));
for frame = 1 : numberOfFrames - 2
    thisFrame = mov_new(:,:,:,frame);
    for x = 1 : WIDTH
        for y = 1 : HEIGHT
            arr = thisFrame(y,x,:);
            if arr(1,1,1) < THRESHOLD
                mov_diff_1(y,x,1,frame) = 0;
                mov_diff_1(y,x,2,frame) = 0;
                mov_diff_1(y,x,3,frame) = 0;
            end
        end
    end
end
newVid = VideoWriter('frames/threshold.avi');
open(newVid);
writeVideo(newVid, mov_diff_1);
close(newVid);
disp(strcat('Finished Difference Calculations, took', num2str(cputime-starttime), ' seconds'));

%% Median
% DESCRIPTIVE TEXT

starttime = cputime;
mov_median = mov_diff_1;
for frame = 1 : numberOfFrames - 2
    thisFrame = mov_diff_1(:,:,:,frame);
    for x = 1 : WIDTH
        for y = 1 : HEIGHT
            A = [];
            if(x > 1 && y > 1 && x < WIDTH && y < HEIGHT)
                A = [thisFrame(y-1,x-1,1) thisFrame(y,x-1,1) thisFrame(y-1,x,1) thisFrame(y-1,x+1,1) thisFrame(y+1,x-1,1) thisFrame(y+1,x+1,1) thisFrame(y,x+1,1) thisFrame(y+1,x,1)];
            elseif(y == 1)
                if(x == 1)
                    A = [thisFrame(y,x+1,1) thisFrame(y+1,x+1,1) thisFrame(y+1,x,1)];
                elseif(x == WIDTH)
                    A = [thisFrame(y,x-1,1) thisFrame(y+1,x-1,1) thisFrame(y+1,x,1)];
                else
                    A = [thisFrame(y,x-1,1) thisFrame(y,x+1,1) thisFrame(y+1,x-1,1) thisFrame(y+1,x+1,1) thisFrame(y+1,x,1)];
                end
            elseif(y == HEIGHT)
                if(x == 1)
                    A = [thisFrame(y-1,x+1,1) thisFrame(y-1,x,1) thisFrame(y,x+1,1)];
                elseif(x == WIDTH)
                    A = [thisFrame(y-1,x,1) thisFrame(y-1,x-1,1) thisFrame(y,x-1,1)];
                else
                    A = [thisFrame(y,x-1,1) thisFrame(y-1,x-1,1) thisFrame(y-1,x,1) thisFrame(y-1,x+1,1) thisFrame(y,x+1,1)];
                end
            elseif(x == 1)
                if(y == 1)
                    A = [thisFrame(y,x+1,1) thisFrame(y+1,x+1,1) thisFrame(y+1,x,1)];
                elseif(y == HEIGHT)
                    A = [thisFrame(y-1,x,1) thisFrame(y-1,x+1,1) thisFrame(y+1,x,1)];
                else
                    A = [thisFrame(y-1,x,1) thisFrame(y,x+1,1) thisFrame(y-1,x+1,1) thisFrame(y+1,x+1,1) thisFrame(y+1,x,1)];
                end
            elseif(x == WIDTH)
                if(y == 1)
                    A = [thisFrame(y+1,x-1,1) thisFrame(y,x-1,1) thisFrame(y,x+1,1)];
                elseif(y == HEIGHT)
                    A = [thisFrame(y-1,x,1) thisFrame(y-1,x-1,1) thisFrame(y,x-1,1)];
                else
                    A = [thisFrame(y,x-1,1) thisFrame(y-1,x-1,1) thisFrame(y-1,x,1) thisFrame(y+1,x-1,1) thisFrame(y+1,x,1)];
                end
            end
            val = median(A);
            mov_median(y,x,1,frame) = val;
            mov_median(y,x,2,frame) = val;
            mov_median(y,x,3,frame) = val;
        end
    end
end
newVid = VideoWriter('frames/median.avi');
open(newVid);
writeVideo(newVid, mov_median);
close(newVid);
disp(strcat('Finished median Calculations, took', num2str(cputime-starttime), ' seconds'));

%% Sobel
% DESCRIPTIVE TEXT
starttime = cputime;
sobel_mov = mov_median;
for frame = 1 : numberOfFrames - 2
    thisFrame = mov_median(:,:,:,frame);
    for x = 1 : WIDTH
        for y = 1 : HEIGHT
            if(x > 1 && x < WIDTH && y > 1 && y < HEIGHT)
                P1 = thisFrame(y-1,x-1,1);
                P2 = thisFrame(y-1,x,1);
                P3 = thisFrame(y-1,x+1,1);
                P4 = thisFrame(y,x-1,1);
                P5 = thisFrame(y,x,1);
                P6 = thisFrame(y,x+1,1);
                P7 = thisFrame(y+1,x-1,1);
                P8 = thisFrame(y+1,x,1);
                P9 = thisFrame(y+1,x+1,1);
                G = abs((P1+(2*P2)+P3)-(P7+(2*P8)+P9)) + abs((P3+(2*P6)+P9)-(P1+(2*P4)+P7));
                sobel_mov(y,x,1,frame) = G;
                sobel_mov(y,x,2,frame) = G;
                sobel_mov(y,x,3,frame) = G;
            else
                sobel_mov(y,x,1,frame) = 0;
                sobel_mov(y,x,2,frame) = 0;
                sobel_mov(y,x,3,frame) = 0;
            end
        end
    end
end
newVid = VideoWriter('frames/sobel.avi');
open(newVid);
writeVideo(newVid, sobel_mov);
close(newVid);
disp(strcat('Finished sobel Calculations, took', num2str(cputime-starttime), ' seconds'));

%% overlay
% DESCRIPTIVE TEXT
starttime = cputime;
vid = VideoReader('frames/sobel.avi');
vid2 = VideoReader('frames/shorter.mp4');
writerObj = VideoWriter('frames/result.avi');
open(writerObj);
numberOfFrames = vid2.NumberOfFrames;
for frame = 1 : numberOfFrames
    if frame == 1
        writeVideo(writerObj, read(vid2, frame));
    elseif frame == numberOfFrames
        writeVideo(writerObj, read(vid2, frame));
    else
        thisDifferenceFrame = read(vid, frame-1);
        thisOriginalFrame = read(vid2, frame);
        for x = 1 : WIDTH
            for y = 1 : HEIGHT
                arr = thisDifferenceFrame(y,x,:);
                if arr(1,1,1) == 255 || arr(1,1,2) == 255 || arr(1,1,3) == 255
                    thisOriginalFrame(y,x,1) = 57;
                    thisOriginalFrame(y,x,2) = 255;
                    thisOriginalFrame(y,x,3) = 20;
                end
            end
        end
        writeVideo(writerObj, thisOriginalFrame);
    end
end
close(writerObj);
disp(strcat('Finished overlay Calculations, took', num2str(cputime-starttime), ' seconds'));