# B-Spline Toolbox

## Description

A basic toolbox for bSpline-based interpolation and signal approximation, for both functions and images. 

The demos (*oneDimensionDemo.m* and *imageDemo.m*) allow you to reconstruct a polynomial and an image. If there is not interpolation in the image case, the MSE and the PSNR are computed as well.

The function *getCoeffsBSpline.m* computes the coefficients of the signal in the B-Spline decomposition of order N (analysis step). The function getSignalfromCoeff.m performs the inverse process: it recovers the signal from the coefficients of the representation (synthesis step). 

The function *getBSpline.m* computes the sampled version of the B-Spline of order N and its corresponding dual basis performing spectral factorization, based on Daebuchies formula. Check the following paper for more info. 

[1] Unser, Michael & Aldroubi, Akram & Eden, Murray. (1991). **Fast B-Spline Transforms for Continuous Image Representation and Interpolation.** *IEEE Trans. Pattern Anal. Mach. Intell.*. 13. 277-285.

## Applications

This toolbox might be useful for image analysis: B-Splines provide a powerful way of representing images which can be analyzed easily. Furhtermore, they allow to represent linear functions, providing a powerful bridge with wavelet theory.  You may find B-Splines in several up-to-date signal processing papers.
## Disclaimer

In case you find any bugs or something which is hard to explain in the code, please, contact me.

## License

You can do whatever you think it is best with the code.
