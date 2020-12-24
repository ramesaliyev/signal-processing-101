function [n, xn] = calculate_for_w_limit(W)
    range = 20;
    
    n = -range:1:range;
    xn = sin(n * W) ./ (n * pi);
    
    syms z
    f = sin(z * W) / (z * pi);
    xn(range + 1) = limit(f, z, 0);
end
