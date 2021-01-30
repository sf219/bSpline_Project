%% set up the environment
close all
clear
%% initialise the symulation parameters
N = 8; % Continuous B-Spline order
m_syn = 1; % increase in the number of samples in the reconstruction stage
%% generate the B-Splines
bSpline_analysis = getBSpline(N, 1);
bSpline_synthesis = getBSpline(N, m_syn);
%% load the desired image
im = imread('Images/48876.jpg');
% to gray; we could consider color images to just repeating the procedure
imtocon = rgb2gray(im);
imreal = double(imtocon)/255; % to double in the 0-1 range
exp_fac = length(bSpline_analysis); %this term takes into account the delay
% periodic extension of the image to retrieve it perfectly
imtocon = zeros(size(imreal, 1)+2*exp_fac, size(imreal, 2)+2*exp_fac);
imtocon(exp_fac+1:end-exp_fac, exp_fac+1:end-exp_fac) = imreal;
imtocon(exp_fac+1:end-exp_fac, 1:exp_fac ) = imreal(:, exp_fac:-1:1);
imtocon(1:exp_fac, exp_fac+1:end-exp_fac) = imreal(exp_fac:-1:1, :);
imtocon(exp_fac+1:end-exp_fac, end-exp_fac:end) = imreal(:, end:-1:end-exp_fac);
imtocon(end-exp_fac:end, exp_fac+1:end-exp_fac) = imreal(end:-1:end-exp_fac, :);

%% Get the coefficients
c1 = getCoeffsBSpline(imtocon, N);
cdef = getCoeffsBSpline(c1', N)';
%% reconstruct the signal from the coefficients
xRec = getSignalFromCoeff(cdef, N, m_syn);
xrec = getSignalFromCoeff(xRec', N, m_syn)';
% remove the extended part
xrec = xrec(exp_fac+1:end-exp_fac, exp_fac+1:end-exp_fac);
% express the MSE with respect to the original image
if(m_syn == 1)
    MSE = mean(mean(abs(xrec-imreal).^2));
    PSNR = 10*log10(255^2/MSE);
    fprintf('The MSE is: %4.5f; the PSNR is: %4.5f dB\n', MSE, PSNR);
    figure2
    subplot(121)
    imagesc(xrec)
    title('Recovered image')
    subplot(122)
    imagesc(imreal)
    title('Real image')
else
    imagesc(xrec)
end
