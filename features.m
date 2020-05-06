function [vectorSumRow,vectorSumCol,vectorDistRowLeft,vectorDistRowRight,vectorDistColUp,vectorDistColDown,vectorDiffRowLeft,vectorDiffRowRight,vectorDiffColUp,vectorDiffColDown] = features(matrixIm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row, col] = size(matrixIm);
vectorSumRow = zeros(1,row);
vectorSumCol = zeros(1,col);

vectorDistRowLeft = zeros(1,row);
vectorDistRowRight = zeros(1,row);
vectorDistColUp = zeros(1,col);
vectorDistColDown = zeros(1,col);

vectorDiffRowLeft = zeros(1,row-1);
vectorDiffRowRight = zeros(1,row-1);
vectorDiffColUp = zeros(1,col-1);
vectorDiffColDown = zeros(1,col-1);

vectorDistRowLeft(1,:) = 400;
vectorDistRowRight(1,:) = 400;
vectorDistColUp(1,:) = 400;
vectorDistColDown(1,:) = 400;

for j = 1:col
    vectorSumCol(j) = sum(matrixIm(:,j));
end
for i = 1:row
    vectorSumRow(i) = sum(matrixIm(i,:));
    for j = 1:col
        if (matrixIm(i,j) > 0)
            if(j < vectorDistRowLeft(1,i))
                vectorDistRowLeft(1,i) = j - 1;
            end
            if((col - j) < vectorDistRowRight(1,i))
                vectorDistRowRight(1,i) = (col - j);
            end
            if(i < vectorDistColUp(1,j))
                vectorDistColUp(1,j) = i - 1;
            end
            if((row - i) < vectorDistColDown(1,j))
                vectorDistColDown(1,j) = (row - i);
            end
        end
    end
end

for i = 1:row-1
    vectorDiffRowLeft(1,i) = vectorDistRowLeft(1,i+1) - vectorDistRowLeft(1,i);
    vectorDiffRowRight(1,i) = vectorDistRowRight(1,i+1) - vectorDistRowRight(1,i);
    vectorDiffColUp(1,i) = vectorDistColUp(1,i+1) - vectorDistColUp(1,i);
    vectorDiffColDown(1,i) = vectorDistColDown(1,i+1) - vectorDistColDown(1,i);
end



end

