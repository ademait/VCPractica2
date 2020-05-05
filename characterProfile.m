function [vectorDistRowLeft, vectorDistRowRight, vectorDistColUp, vectorDistColDown] = characterProfile(matrixIm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row, col] = size(matrixIm);
vectorDistRowLeft = zeros(1,row);
vectorDistRowRight = zeros(1,row);
vectorDistColUp = zeros(1,col);
vectorDistColDown = zeros(1,col);

vectorDistRowLeft(1,:) = 400;
vectorDistRowRight(1,:) = 400;
vectorDistColUp(1,:) = 400;
vectorDistColDown(1,:) = 400;

for i = 1:row
    for j = 1:col
        if (matrixIm(i,j) > 0)
            if(j < vectorDistRowLeft(1,i))
                vectorDistRowLeft(1,i) = j;
            end
            if((col - j) < vectorDistRowLeft(1,i))
                vectorDistRowLeft(1,i) = (col - j);
            end
            if(i < vectorDistColUp(1,j))
                vectorDistColUp(1,j) = i;
            end
            if((row - i) < vectorDistColDown(1,j))
                vectorDistColDown(1,j) = (row - i);
            end
        end
    end
end


end

