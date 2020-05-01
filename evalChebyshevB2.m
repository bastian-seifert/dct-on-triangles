function [value] = evalChebyshevB2(idxK,idxL,arg1,arg2)
%EVALCHEBYSHEV evaluates the (k,l) B2 Chebyshev poly on (arg1,arg2)
%   
value = 0.25* (cos(2*pi*(idxK .* arg1 + idxL .* arg2)) + ...
                cos(2*pi*((idxK + idxL) .* arg1 - idxL .* arg2)) + ...
                cos(2*pi*(idxK .* arg1 - (2*idxK + idxL) .* arg2)) + ...
                cos(2*pi*((idxK + idxL).*arg1 - (2*idxK + idxL).*arg2)));
end

