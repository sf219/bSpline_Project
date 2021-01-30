function Coeffs = getCoeffsBSpline(signalIn, N)
% SAMUEL FERNANDEZ MENDUIÑA
% This function computes the coefficients of the signal given the order of
% the continuous B-Spline N
% INPUTS:
%   signalIn: the signal to decompose
%   N: the order of the continuous B-Spline
% OUTPUTS:
%   Coeffs: Coefficients of the representation
% This function is based on the results exposed in the following papers:
%   [1] Unser, Michael & Aldroubi, Akram & Eden, Murray. (1991).
%       Fast B-Spline Transforms for Continuous Image Representation and
%       Interpolation. IEEE Trans. Pattern Anal. Mach. Intell.. 13. 277-285.
%

bSpline_analysis = getBSpline(N, 1); % compute the BSpline
% normalised denominator coefficients
as = bSpline_analysis(1:end)/(bSpline_analysis(1));
% scaled numerator coefficients
bs = 1/(bSpline_analysis(1));
% sort in descend order the roots, since they always appear in pairs,
% getting half of them and performing filtfilt is going to produce the
% result we look for; additionally it produces a zero-phased output
root = sort(roots(as), 'descend');
root = root(1:length(root)/2);
[sos, g] = zp2sos(roots(bs), root, 1);
% this type of filter does not introduce delay
Coeffs = 1/bSpline_analysis(1)*prod(abs(root))*filtfilt(sos, g, signalIn);
% scale conveniently to match the expressions in [1]
end