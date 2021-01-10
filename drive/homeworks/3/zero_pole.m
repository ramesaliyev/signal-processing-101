clc
clear

lpoles = randi([2 10]);
lzeros = randi([2 lpoles]);

zeros = -1 + 2.*rand(1, lzeros);
poles = -1 + 2.*rand(1, lpoles);

[z, p, ~] = tf2zp(zeros, poles);
zplane(z, p);