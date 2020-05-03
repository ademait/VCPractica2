function [vectorSumRow, vectorSumCol] = pixelCount(matrixIm)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row, col] = size(matrixIm);
vectorSumRow = zeros(1,row);
vectorSumCol = zeros(1,col);
for i = 1:row
    vectorSumRow(i) = sum(matrixIm(i,:));
end
for j = 1:col
    vectorSumCol(j) = sum(matrixIm(:,j));
end
    

end

