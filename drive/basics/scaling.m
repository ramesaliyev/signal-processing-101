t = 0:0.01:5;

amplitude = 20;
frequency = 2;

a1 = 1;
b1 = 1;
A = amplitude * a1 * cos(2 * pi * frequency * b1 * t);

a2 = 2;
b2 = 1;
B = amplitude * a2 * cos(2 * pi * frequency * b2 * t);

a3 = 1/2;
b3 = 1;
C = amplitude * a3 * cos(2 * pi * frequency * b3 * t);

a4 = 1;
b4 = 2;
D = amplitude * a4 * cos(2 * pi * frequency * b4 * t);

a5 = 1;
b5 = 1/2;
E = amplitude * a5 * cos(2 * pi * frequency * b5 * t);

% axis limits
maxA = max([max(A) max(B) max(C) max(D) max(E)]) + 10;
xlim([0 max(t)]);

subplot(5,1,1);
plot(t, A);
ylim([-maxA maxA]);
title('a=1, b=1','fontsize', 20);

subplot(5,1,2);
plot(t, B);
ylim([-maxA maxA]);
title('a=2, b=1','fontsize', 20);

subplot(5,1,3);
plot(t, C);
ylim([-maxA maxA]);
title('a=1/2, b=1','fontsize', 20);

subplot(5,1,4);
plot(t, D);
ylim([-maxA maxA]);
title('a=1, b=2','fontsize', 20);

subplot(5,1,5);
plot(t, E);
ylim([-maxA maxA]);
title('a=1, b=1/2','fontsize', 20);