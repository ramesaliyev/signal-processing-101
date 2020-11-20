function plot_discrete_conv(x, h, y, name)
    % Print all variables.
    disp('x');
    disp(x);
    disp('h');
    disp(h);
    disp('y');
    disp(y);
    
    figure();
    set(gcf,'name', name)
    
    x_len = length(x);
    h_len = length(h);
    
    % When plotting x and h
    % complete shorter one's
    % length with zeroes.
    
    % Plot x[n]
    subplot(3, 1, 1);
    stem([x, zeros(1, h_len - x_len)]);
    title('x');
        
    % Plot h[n]
    subplot(3, 1, 2);
    stem([h, zeros(1, x_len - h_len)]);
    title('h');
     
    % Plot y[n]
    subplot(3, 1, 3);
    stem(y);
    title('y = x∗h');
end