clc
clear

W = -pi:0.01:pi;
Wc = pi/2;
M = 50;
n = -M:M;

hn = sin(Wc.*n)./(pi.*n);
hn(M+1) = Wc/pi;

H = zeros(1, length(W));
for k = 1:length(H)
    H(k) = sum(hn.*exp(-1i*W(k)*n));
end

plot(W, abs(H));
title(strcat('Low-Pass Filter M=', num2str(M)));
set(gca,'XTick',-2*pi:pi:2*pi)
set(gca,'XTickLabel',{'-2\pi','-\pi','0','\pi','2\pi'});
grid on;