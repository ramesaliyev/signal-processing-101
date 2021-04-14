clc
% clear all
close all

% Randomize signals.
% x = randperm(100, 40);
% h = randperm(100, 10);

% Reverse saw signal vs ramp signal.
x = repmat([20:-1:1, zeros(1, 5)], 1, 4);
h = 1:1:100;

% Convolution between real and imaginary part of same signal.
% complex = exp(1i * pi/18 .* (0:25 * pi));
% x = real(complex);
% h = imag(complex);

% Calculate convolution with Built-In conv function
plot_discrete_conv(x, h, conv(x, h), 'With Built-in Conv Fn');

% Calculate convolution with Our convolution function
plot_discrete_conv(x, h, calculate_discrete_conv(x, h), 'With Our Conv Fn');