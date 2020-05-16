function [TResult] = reduirDescriptors(idx,T,numFeat,numTotal)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
start = numFeat;
final = numTotal;
TResult = T;
for i = start:final
    var = 'Var';
    r = strcat(var,int2str(idx(i)));
    TResult = removevars(TResult,r);
end
end

