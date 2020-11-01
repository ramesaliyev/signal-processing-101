t = 0:0.01:5;
A = 10 * cos(2*pi*t);
B = 20 * cos(2*pi*2*t);
C = A + B;

% axis limits
maxA = max([max(A) max(B) max(C)]) + 5;
xlim([0 max(t)]);

subplot(3,2,1);
plot(t, A);
ylim([-maxA maxA]);
title('A, A=10, f=1','fontsize', 20);

subplot(3,2,2);
plot(abs(fft(A))); % fast fourier transform
title('A, Freq Domain','fontsize', 20);

subplot(3,2,3);
plot(t, B);
ylim([-maxA maxA]);
title('B, A=20, f=2','fontsize', 20);

subplot(3,2,4);
plot(abs(fft(B)));
title('B, Freq Domain','fontsize', 20);

subplot(3,2,5);
plot(t, C);
ylim([-maxA maxA]);
title('C = A+B','fontsize', 20);

subplot(3,2,6);
plot(abs(fft(C)));
title('C, Freq Domain','fontsize', 20);