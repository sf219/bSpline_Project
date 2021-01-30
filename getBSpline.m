function [G] = getBSpline(N, m)
% SAMUEL FERNANDEZ MENDUIÑA
% This function obtains the sampled version of the B-Spline of order N and 
% its corresponding dual basis performing spectral factorisation based on 
% the Daebuchies formula. 
% INPUTS:
%   N: the order of the continuous B-Spline
%   m: interpolation factor
% OUTPUTS:
%   G: B-Spline samples
% This function is based on the results exposed in the following papers:
%   [1] Unser, Michael & Aldroubi, Akram & Eden, Murray. (1991). 
%       Fast B-Spline Transforms for Continuous Image Representation and 
%       Interpolation. IEEE Trans. Pattern Anal. Mach. Intell.. 13. 277-285.
%
% I use netwon series to obtain the basis and its dual
numVan = N+1; % this is the number of vanishing moments
% allowed values for j and k
j = 0:numVan;
k = (min(mod(N, 2), mod(m, 2)):numVan*m-mod(m, 2))'+1/2*(1-mod(N, 2))*mod(m, 2);
% just apply known formula for getting direct basis [1]
% factorial term
G = factorial(numVan)./(factorial(j).*factorial(numVan-j));
% ensemble all the parts
Gprov = G.*(-1).^(j)/factorial(N);
kmjm = ((k-j*m).*(k>j*m)).^N;
% final term
G = (Gprov*kmjm')/(m^N);
end