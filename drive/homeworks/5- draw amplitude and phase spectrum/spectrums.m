clc
clear
close all

O = -2*pi:0.01:2*pi;

figure;
plot_spectrums(O, calc(@hn_freq_response, O));

figure;
plot_spectrums(O, calc(@xn_dtft, O));

function fr = hn_freq_response(o)
    N = 15;
    fr = (1 - exp(-1i*o*N)) / (1 - exp(-1i*o));
end

function ft = xn_dtft(o)
    a = 0.5;
    ft = 1 / (1 - a*exp(-1i*o));
end

function y = calc(H, O)
    len = length(O);
    y = zeros(1, len);
    
    for j = 1:len
        y(j) = H(O(j));
    end
end

function plot_spectrums(O, X)
    amplitudes = arrayfun(@(x) abs(x), X);
    phases = arrayfun(@(x) angle(x), X);
    plotfn(1, O, amplitudes, 'amplitude spectrum');
    plotfn(2, O, phases, 'phase spectrum');
end

function plotfn(num, X, Y, name)
    subplot(2,1, num);
    plot(X, Y);
    grid on;
    title(name);
    set(gca,'XTick',-2*pi:pi:2*pi)
    set(gca,'XTickLabel',{'-2\pi','-\pi','0','\pi','2\pi'});
end