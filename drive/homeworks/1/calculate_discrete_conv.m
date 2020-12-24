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
