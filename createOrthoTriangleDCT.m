function [triangleDCT] = createOrthoTriangleDCT(sizeN)
%CREATEORTHOTRIANGLEDCT creates the orthogonal version of the DCT on
%tangles
%   Detailed explanation goes here
triangleDCT = createTriangleDCT(sizeN);

%create Hplus matrix
H = arrayfun(@(sz) [sqrt(8),4*ones(1,sz-2),sqrt(8)],2:sizeN,'UniformOutput',false);
Hplus = diag([sqrt(2),H{:}]);
%create D matrix

D = arrayfun(@(sz) [1/(sqrt(2)*sizeN),1/sizeN*ones(1,sz-1)],1:sizeN,'UniformOutput',false);
D = diag([D{:}]);
%D = eye(size(Hplus,1));
triangleDCT = D*triangleDCT*Hplus;
end

