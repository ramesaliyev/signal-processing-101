x = 0:0.01:5;
y = 10 * cos(2*pi*x) + 20 * cos(2*pi*3*x) + 40 * cos(2*pi*5*x);

y = y/max(y);
ynoise = y + 0.2*randn(size(y));
ffty = fft(y);
fftynoise = fft(ynoise);
iffty = ifft(ffty);
ifftynoise = ifft(fftynoise);

yreduced = fftynoise .* 1;
yreduced(30:470) = 0;
ifftyreduced = ifft(yreduced);

subplot(8,2,1);
plot(x, y);
title('Signal','fontsize', 10);

subplot(8,2,2);
plot(x, ynoise);
title('Signal with noise','fontsize', 10);

subplot(8,2,3);
plot(x, abs(ffty));
title('FFT of signal','fontsize', 10);

subplot(8,2,4);
plot(x, abs(fftynoise));
title('FFT of signal with noise','fontsize', 10);

subplot(8,2,5);
plot(x, iffty);
title('IFFT of FFT of signal','fontsize', 10);

subplot(8,2,6);
plot(x, ifftynoise);
title('IFFT of FFT of signal with noise','fontsize', 10);

subplot(8,2,7);
plot(x, ifftyreduced);
title('IFFT of reduced FFT of signal with noise','fontsize', 10);

subplot(8,2,8);
plot(x, abs(yreduced));
title('Reduced FFT of signal with noise','fontsize', 10);