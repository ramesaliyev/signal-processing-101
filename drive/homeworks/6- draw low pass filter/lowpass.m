clc
clear
% close all

Om = -pi:0.01:pi;
Oc = pi/2;
M = 10;

H = lowpassfilter(Om, Oc, M);

title = strcat('Low-Pass Filter M=', num2str(M));
plotfn(Om, abs(H), title);

function y = lowpassfilter(Om, Oc, M)
    len = length(Om);
    y = zeros(1, len);
    
    for j = 1:len
        W = Om(j);
        
        for n = -M:M
            value = 0;
            
            if n == 0
                value = Oc/pi;
            else
                value = ((sin(Oc*n)/(pi*n)) * exp(-1i*W*n));
            end
            
            y(j) = y(j) + value;
        end
    end
end

function plotfn(X, Y, name)
    plot(X, Y);
    grid on;
    title(name);
    set(gca,'XTick',-2*pi:pi:2*pi)
    set(gca,'XTickLabel',{'-2\pi','-\pi','0','\pi','2\pi'});
end