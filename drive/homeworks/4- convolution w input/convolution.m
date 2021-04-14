%clc
%clear

xn = input("x[n]: ");
xL = input("x Low: ");
xH = length(xn) + xL - 1;

hn = input("h[n]: ");
hL = input("h Low: ");
hH = length(hn) + hL - 1;

xLH = xL:xH;
hLH = hL:hH;

subplot(2,2,1);
stem(xLH, xn, "filled");
title('x[n]');

subplot(2,2,2);
stem(hLH, hn, "filled");
title('h[n]');

yn_conv = conv(xn, hn);
yn_myconv = calculate_discrete_conv(xn, hn);
convL = xL + hL;
convH = xH + hH;
convLH = convL:convH;

subplot(2,2,3);
stem(convLH, yn_myconv, "filled");
title('my conv fn');

subplot(2,2,4);
stem(convLH, yn_conv, "filled");
title('matlab conv fn');

function y = calculate_discrete_conv(x, h)
    x_len = length(x);
    h_len = length(h);
    
    % create result vector
    y_len = x_len + h_len - 1;
    y = zeros(1, y_len);

    % pad signals with zeroes
    x = [x, zeros(1, h_len)];
    h = [h, zeros(1, x_len)];
    
    % calculate y[n]
    for n = 1:y_len
        % from convulation formula for discrete time,
        % y[n] = Σ{1~n}(x[k]h[n-k])
        for k = 1:n
            y(n) = y(n) + (x(k) * h(n + 1 - k));
        end
    end
end
