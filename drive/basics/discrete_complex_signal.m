clc

n = (0:20 * pi);
x1 = exp(1i * pi/6 .* n);
whos; % will print information about variables

% stem: will draw discrete-time plot

subplot(2, 1, 1);
stem(n, real(x1)) % real: get real part of complex number.
title('Real part');
xlabel('n');

subplot(2,1,2);
stem(n, imag(x1)); % real: get imaginary part of complex number.
title('Imag part');
xlabel('n');