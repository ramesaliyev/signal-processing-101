t = 0:0.01:5;
A = 10 * cos(2*pi*t);
B = 20 * cos(2*pi*3*t);
C = 40 * cos(2*pi*5*t);
D = A + B + C;

% axis limits
maxA = max([max(A) max(B) max(C) max(D)]) + 10;
xlim([0 max(t)]);

subplot(4,1,1);
plot(t, A);
ylim([-maxA maxA]);
title('A, A=10, f=1','fontsize', 20);

subplot(4,1,2);
plot(t, B);
ylim([-maxA maxA]);
title('B, A=20, f=3','fontsize', 20);

subplot(4,1,3);
plot(t, C);
ylim([-maxA maxA]);
title('C, A=40, f=5','fontsize', 20);

subplot(4,1,4);
plot(t, D);
ylim([-maxA maxA]);
title('D = A+B+C','fontsize', 20);
