function [n, xn] = calculate_for_w(W)
    range = 20;
    
    n = -range:1:range;
    xn = sin(n * W) ./ (n * pi);
    xn(range + 1) = W / pi;
end
