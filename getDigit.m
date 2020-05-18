function [outputArg1, outputArg2] = getDigit(matriuImatges, labels, trainedModel)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = size(matriuImatges,3);

Nft = 3112;
vartypes = strings([1,Nft+1]);
vartypes{Nft+1} = 'string';
vartypes(1:Nft) = 'double';
T = table('Size',[N Nft+1],'VariableTypes',vartypes);

for i = 1:N
    im=matriuImatges(:,:,i); 
    [sumRow,sumCol,distRowLeft,distRowRight,distColUp,distColDown,diffRowLeft,diffRowRight,diffColUp,diffColDown] = features(im);
    
    T{i,1:20} = sumRow;
    T{i,21:40} = sumCol;
    T{i,41:60} = distRowLeft;
    T{i,61:80} = distRowRight;
    T{i,81:100} = distColUp;
    T{i,101:120} = distColDown;
    T{i,121:139} = diffRowLeft;
    T{i,140:158} = diffRowRight;
    T{i,159:177} = diffColUp;
    T{i,178:196} = diffColDown;

    [hog_2x2, vis2x2] = extractHOGFeatures(im,'CellSize',[2 2]);
    T{i,197:3112} = hog_2x2;
    T.Var3113(i)=labels(i);
    
end
yfit = trainedModel.predictFcn(T);
error = 0;
outputArg2 = table('Size',[N 3],'VariableTypes',{'string' 'string' 'string'},'VariableNames',{'PredictedResult' 'RealValue' 'Correcte'});
for i = 1:N
    outputArg2{i,3} = "1";
    if (string(yfit(i)) ~= T.Var3113(i))
        error = error + 1;
        outputArg2{i,3} = "0";
    end
    outputArg2{i,1} = string(yfit(i));
    outputArg2{i,2} = T.Var3113(i);
end
outputArg1 = (1 - (error / N)) * 100;
end

