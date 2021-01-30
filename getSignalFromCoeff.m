function xRec = getSignalFromCoeff(Coeff, N, m)
% SAMUEL FERNANDEZ MENDUIÑA
% This function computes the signal from the coefficients of the
% representation with B-Splines of order N
%
% INPUTS:
%   Coeffs: the input coefficients
%   N: the order of the continuous B-Spline
%   m: interpolation factor
% OUTPUTS:
%   xRec: Recovered signal
% This function is based on the results exposed in the following papers:
%   [1] Unser, Michael & Aldroubi, Akram & Eden, Murray. (1991).
%       Fast B-Spline Transforms for Continuous Image Representation and
%       Interpolation. IEEE Trans. Pattern Anal. Mach. Intell.. 13. 277-285.
%
% firstly we get the bSpline
bSpline_synthesis = getBSpline(N, m);
expand_fact = (length(bSpline_synthesis)-1)/2;
expand_prev = 0; %(length(bSpline_analysis));
% add zeros to interpolate if necessary
ctofilt = zeros(size(Coeff, 1), m*size(Coeff, 2));
ctofilt(:, 1:m:end) = Coeff;
% add zeros at the end to compensate for the delay of FIR filters
ctofilt = [ctofilt(:, expand_fact:-1:1) ...
    ctofilt, zeros(size(Coeff, 1), expand_fact)];
% perform filtering
xrec = filter(bSpline_synthesis, 1, ctofilt);
% remove zeros
xRec = xrec(:, 2*expand_fact+expand_prev+1:end-expand_prev);
end