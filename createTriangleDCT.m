function [triangleDCT] = createTriangleDCT(sizeN)
%CREATETRIANGLEDCT Creates the DCT on triangles matrix
%   

%build all possible combinations for (k,j)
tmp = combvec(0:1:sizeN-1,1:2:2*sizeN-1);
%filter out the ones who satisfy constraint 
idx=2*tmp(1,:) <= tmp(2,:);
%create set of zeros of T_n
zerosOfIdeal = tmp(:,idx) ./ [2*sizeN; 4*sizeN];

%build all possible indices (k,l)
tmp = combvec(0:1:sizeN-1,0:1:sizeN-1);
%filter out the ones who satisfy constraint 
idx=(tmp(1,:) + tmp(2,:)) < sizeN;
chebIdx = tmp(:,idx);
%evaluate B2 Chebyshev polynomials on zeros to obtain DCT on triangles
triangleDCT = arrayfun(@(i)evalChebyshevB2(chebIdx(1,i),chebIdx(2,i),...
                            zerosOfIdeal(1,:),zerosOfIdeal(2,:)),1:length(chebIdx),'UniformOutput',false);
triangleDCT = reshape([triangleDCT{:}],[length(chebIdx), length(chebIdx)]);
end

