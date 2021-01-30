%% set up the environment
close all
clear
%% initialise the symulation parameters
N = 3; % Continuous B-Spline order
m_syn = 2; % increase in the number of samples in the reconstruction stage
%% generate the synthetic signal
t = 0:99;
exponent = 1;
x = (t.^exponent); % simple polynomial
%% generate the B-Splines and stem them
bSpline_analysis = getBSpline(N, 1); 
bSpline_synthesis = getBSpline(N, m_syn);
figure2
stem(bSpline_analysis, 'linewidth', 2)
hold on
stem(bSpline_synthesis, 'linewidth', 2)
title('B-Spline Synthesis and Analysis samples')
legend('Analysis', 'Synthesis')
legend box off
%% Get the coefficients
c = getCoeffsBSpline(x, N);
%% reconstruct the signal from the coefficients
% it throws a warnign because in the filtfilt function, for N = 3|2 the
% matrix SOS only has one row; it's nothing you should worry about
xrec = getSignalFromCoeff(c, N, m_syn);
%% check the accuracy of the estimation and the interpolation
% since we consider a finite interval, the first and last samples are
% innaccurate
init = floor(length(bSpline_synthesis))*m_syn;
tnew = 0:1/m_syn:100;
ttocon = tnew(init:end-init);
xnew = ttocon.^exponent;
% small delay that appears in case m or N are even and odd
% plot figures and compute error MSE
figure2
hold on
xconsider = xrec(init:end);
xconsider = xconsider(1:length(ttocon));
plot(ttocon, xconsider, 'b', 'linewidth', 2)
plot(ttocon, xnew, 'xr', 'linewidth', 2)
MSE = mean(abs(xconsider-xnew).^2);
title(sprintf('Original signal vs reconstructed version. MSE: %1.4f', MSE))
legend('Recovered signal', 'Real version')
legend box off