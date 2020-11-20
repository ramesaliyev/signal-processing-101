% clc
% clear all
% close all

x = randperm(60, 20);
h = randperm(60, 20);

y = conv(x, h);
plot_discrete_conv(x, h, y, 'With Built-in Conv');