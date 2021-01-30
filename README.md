# B-Spline Project
An easy to use toolbox for bSpline-based interpolation and signal approximation, for both functions and images. 

The demos (oneDimensionDemo.m and imageDemo.m) allow you to reconstruct a polynomial and an image. If there is not interpolation in the image case, the MSE and the PSNR are computed as well.

The function getCoeffsBSpline.m computes the coefficients of the signal in the B-Spline decomposition of order N (analysis step). The function getSignalfromCoeff.m performs the inverse process: it recovers the signal from the coefficients of the representation (synthesis step). 

The function getBSpline.m computes the sampled version of the B-Spline of order N and its corresponding dual basis performing spectral factorization, based on Daebuchies formula. Check the following paper for more info. 

[1] Unser, Michael & Aldroubi, Akram & Eden, Murray. (1991). Fast B-Spline Transforms for Continuous Image Representation and Interpolation. IEEE Trans. Pattern Anal. Mach. Intell.. 13. 277-285.

This toolbox might be useful for image analysis: B-Splines provide a powerful way of representing images which can be analyzed easily. Furhtermore, they allow to represent linear functions, providing a powerful bridge with wavelet theory.  You may find B-Splines in several up-to-date signal processing papers, as

[1] Bhandari, A., Beckmann, M. and Krahmer, F., 2021, January. The modulo Radon transform and its inversion. In 2020 28th European Signal Processing Conference (EUSIPCO) (pp. 770-774). IEEE.

[2] Bhandari, Ayush, and Felix Krahmer. "HDR imaging from quantization noise." In 2020 IEEE International Conference on Image Processing (ICIP), pp. 101-105. IEEE, 2020.

[3] S. Aziznejad, M. Unser, "Deep Spline Networks with Control of Lipschitz Regularity," Best student paper award, Proceedings of the Forty-Fourth IEEE International Conference on Acoustics, Speech, and Signal Processing (ICASSP'19), Brighton, United Kingdom, May 12-17, 2019, pp. 3242-3246.

# Disclaimer

In case you find any bugs or something which is hard to explain in the code, please, contact me.

# License

You can do whatever you think it is best with the code.
