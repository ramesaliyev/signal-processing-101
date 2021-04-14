clc
clear all
%close all

figure;
set(gcf, 'units', 'normalized');
set(gcf, 'Position', [0, 0, 1, 1]);

[n, xn] = calculate_for_w(pi/4);
subplot(3,1,1);
stem(n, xn);
title('W = \pi / 4');

[n, xn] = calculate_for_w(pi/6);
subplot(3,1,2);
stem(n, xn);
title('W = \pi / 6');

[n, xn] = calculate_for_w(pi/8);
subplot(3,1,3);
stem(n, xn);
title('W = \pi / 8');