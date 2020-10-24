clc
clear all
close all

% from=1 to=10 step=0.01
t1 = 1:0.01:10;

% from=-10, to=1-0.01, step=0.01
t2 = -10:0.01:1-0.01;

% timeAxis = [...t2, ...t1]
timeAxis = [t2 t1];

% zeros(row, column)
% MySignal = [0xlength(t2), (sin(2PI*t1) element-wise-division t1)]
MySignal = [zeros(1,length(t2)) sin(2*pi*t1)./t1];

% plot
% x-axis => timeAxis
% y-axis => MySignal
plot(timeAxis, MySignal)

% annotate
ylabel('Amplitude', 'fontsize', 20)
xlabel('time', 'fontsize', 20)
title('My First Signal','fontsize', 20)